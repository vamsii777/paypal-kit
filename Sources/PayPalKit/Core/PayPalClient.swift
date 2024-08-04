import NIO
import AsyncHTTPClient

// MARK: - PayPalClient
public final class PayPalClient {
    public var orders: PayPalOrderRoutes
    
    var handler: PayPalAPIHandler
    
    public init(httpClient: HTTPClient, accessToken: String, environment: PayPalEnvironment) {
        handler = PayPalAPIHandler(httpClient: httpClient, accessToken: accessToken, environment: environment)
        orders = PayPalOrderRoutes(apiHandler: handler, baseUrl: environment.baseUrl)
    }
}