import NIO
import AsyncHTTPClient

// MARK: - PayPalClient
public final class PayPalClient {
    public var orders: PayPalOrderRoutes
    private var handler: PayPalAPIHandler
    
    public init(httpClient: HTTPClient, authType: PayPalAuthType, environment: PayPalEnvironment) {
        self.handler = PayPalAPIHandler(httpClient: httpClient, authType: authType, environment: environment)
        self.orders = PayPalOrderRoutes(apiHandler: handler, baseUrl: environment.baseUrl)
    }
}
