import AsyncHTTPClient
import NIO
import NIOHTTP1
import Foundation

// MARK: - PayPalEnvironment
public enum PayPalEnvironment {
    case sandbox
    case production
    
    var baseUrl: String {
        switch self {
        case .sandbox:
            return "https://api-m.sandbox.paypal.com"
        case .production:
            return "https://api-m.paypal.com"
        }
    }
}

extension HTTPClientRequest.Body {
    /// Creates an HTTP request body from a string.
    ///
    /// - Parameter string: The string to be used as the request body.
    /// - Returns: An `HTTPClientRequest.Body` instance.
    public static func string(_ string: String) -> Self {
        .bytes(.init(string: string))
    }
    
    /// Creates an HTTP request body from data.
    ///
    /// - Parameter data: The data to be used as the request body.
    /// - Returns: An `HTTPClientRequest.Body` instance.
    public static func data(_ data: Data) -> Self {
        .bytes(.init(data: data))
    }
}

// MARK: - PayPalAuthType
public enum PayPalAuthType {
    case clientSecret(clientId: String, secret: String)
    case bearerToken(token: String)
}

// MARK: - PayPalAPIHandler
struct PayPalAPIHandler {
    private let httpClient: HTTPClient
    private let authType: PayPalAuthType
    private let environment: PayPalEnvironment
    private let decoder: JSONDecoder
    
    init(httpClient: HTTPClient, authType: PayPalAuthType, environment: PayPalEnvironment) {
        self.httpClient = httpClient
        self.authType = authType
        self.environment = environment
        self.decoder = JSONDecoder()
        self.decoder.dateDecodingStrategy = .iso8601
    }
    
    func send<T: Codable>(method: HTTPMethod,
                          path: String,
                          query: String = "",
                          body: HTTPClientRequest.Body? = nil,
                          headers: HTTPHeaders) async throws -> T {
        var _headers: HTTPHeaders = ["Content-Type": "application/json",
                                     "Accept": "application/json"]
        
        switch authType {
        case .clientSecret(let clientId, let secret):
            let authString = "\(clientId):\(secret)".data(using: .utf8)!.base64EncodedString()
            _headers.add(name: "Authorization", value: "Basic \(authString)")
        case .bearerToken(let token):
            _headers.add(name: "Authorization", value: "Bearer \(token)")
        }
        
        headers.forEach { _headers.replaceOrAdd(name: $0.name, value: $0.value) }
        
        var request = HTTPClientRequest(url: "\(environment.baseUrl)\(path)?\(query)")
        request.headers = _headers
        request.method = method
        request.body = body
        
        let response = try await httpClient.execute(request, timeout: .seconds(60))
        let responseData = try await response.body.collect(upTo: 1024 * 1024 * 100) // 100 MB limit
        
        return try decoder.decode(T.self, from: Data(buffer: responseData))
    }
}
