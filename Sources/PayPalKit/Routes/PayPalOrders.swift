import NIO
import AsyncHTTPClient

public protocol OrderRoutes: PayPalAPIRoute {
    func createOrder(request: CreateOrderRequest) async throws -> OrderDetails
    func showOrder(orderId: String) async throws -> OrderDetails
    func confirmPaymentSource(orderId: String, request: ConfirmPaymentSourceRequest) async throws -> OrderDetails
    func authorizeOrder(orderId: String, request: AuthorizeOrderRequest) async throws -> AuthorizeOrderResponse
    func captureOrder(orderId: String, request: CaptureOrderRequest) async throws -> OrderDetails
    func updateOrder(orderId: String, patchOperations: [PatchOperation]) async throws
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

    /// Confirms the payment source for an order.
    /// - Parameters:
    ///   - orderId: The ID of the order.
    ///   - request: The `ConfirmPaymentSourceRequest` object containing the payment source details and other instructions.
    /// - Returns: The updated `OrderDetails` object.
    public func confirmPaymentSource(orderId: String, request: ConfirmPaymentSourceRequest) async throws -> OrderDetails {
        let path = "/v2/checkout/orders/\(orderId)/confirm-payment-source"
        let requestBody = try Request.constructRequestBody(request: request)
        return try await apiHandler.send(
            method: .POST,
            path: path,
            body: .data(requestBody),
            headers: headers
        )
    }

    /// Authorizes payment for an order.
    /// - Parameters:
    ///   - orderId: The ID of the order to authorize.
    ///   - request: The `AuthorizeOrderRequest` object.
    /// - Returns: The `AuthorizeOrderResponse` object containing details of the authorized payment.
    public func authorizeOrder(orderId: String, request: AuthorizeOrderRequest) async throws -> AuthorizeOrderResponse {
        let path = "/v2/checkout/orders/\(orderId)/authorize"
        let requestBody = try Request.constructRequestBody(request: request)
        
        return try await apiHandler.send(
            method: .POST,
            path: path,
            body: .data(requestBody),
            headers: headers
        )
    }

    /// Captures payment for an order.
    /// - Parameters:
    ///   - orderId: The ID of the order to capture payment for.
    ///   - request: The `CaptureOrderRequest` object.
    /// - Returns: The `CaptureOrderResponse` object containing details of the captured payment.
    public func captureOrder(orderId: String, request: CaptureOrderRequest) async throws -> OrderDetails {
        let path = "/v2/checkout/orders/\(orderId)/capture"
        let requestBody = try Request.constructRequestBody(request: request)
        
        return try await apiHandler.send(
            method: .POST,
            path: path,
            body: .data(requestBody),
            headers: headers
        )
    }

    /// Updates an order.
    /// - Parameters:
    ///   - orderId: The ID of the order to update.
    ///   - patchOperations: An array of `PatchOperation` structs representing the desired changes to the order.
    /// - Returns: Nothing (HTTP 204 No Content).
    public func updateOrder(orderId: String, patchOperations: [PatchOperation]) async throws {
        let path = "/v2/checkout/orders/\(orderId)"
        let requestBody = try Request.constructRequestBody(request: patchOperations)
        
        _ = try await apiHandler.send(
            method: .PATCH,
            path: path,
            body: .data(requestBody),
            headers: headers
        )
    }
    
}
