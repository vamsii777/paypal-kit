import NIO
import AsyncHTTPClient

public protocol OrderRoutes: PayPalAPIRoute {
    func createOrder(request: CreateOrderRequest) async throws -> OrderDetails
    func showOrder(orderId: String) async throws -> OrderDetails
}

public struct PayPalOrderRoutes: OrderRoutes {
    public var headers: HTTPHeaders = [:]
    private let apiHandler: PayPalAPIHandler
    private let baseUrl: String
    
    init(apiHandler: PayPalAPIHandler, baseUrl: String) {
        self.apiHandler = apiHandler
        self.baseUrl = baseUrl
    }
    
    
    public func createOrder(request: CreateOrderRequest) async throws -> OrderDetails {
        let path = "/v2/checkout/orders"
        let requestBody = try Request.constructRequestBody(request: request)
        return try await apiHandler.send(
            method: .POST,
            path: path,
            body: .data(requestBody),
            headers: headers
        )
    }

    public func showOrder(orderId: String) async throws -> OrderDetails {
        let path = "/v2/checkout/orders/\(orderId)"
        return try await apiHandler.send(
            method: .GET,
            path: path,
            headers: headers
        )
    }
    
}
