import NIO
import AsyncHTTPClient

// MARK: - Request Models

/// Request body for capturing payment for an order.
struct CaptureOrderRequest: Codable, Hashable {
    /// The payment source definition. Use this object only if you have not redirected the user after order creation to approve the payment. In such cases, the user-selected payment method in the PayPal flow is implicitly used.
    let paymentSource: PaymentSource?

    enum CodingKeys: String, CodingKey {
        case paymentSource = "payment_source"
    }
}
