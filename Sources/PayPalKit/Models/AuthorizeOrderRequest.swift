import NIO
import AsyncHTTPClient

// MARK: - Request Models

/// Request body for authorizing payment for an order.
struct AuthorizeOrderRequest: Codable, Hashable {
    /// The source of payment for the order, which can be a token or a card. Use this object only if you have not redirected the user after order creation to approve the payment. In such cases, the user-selected payment method in the PayPal flow is implicitly used.
    let paymentSource: PaymentSource? 

    enum CodingKeys: String, CodingKey {
        case paymentSource = "payment_source"
    }
}
