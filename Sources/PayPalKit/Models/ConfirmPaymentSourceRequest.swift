import NIO
import AsyncHTTPClient

// MARK: - Request Models

/// Request body for confirming the payment source for an order.
struct ConfirmPaymentSourceRequest: Codable, Hashable {
    /// The instruction to process an order.
    let processingInstruction: ProcessingInstruction?
    /// Customizes the payer confirmation experience.
    let applicationContext: ApplicationContext?
    /// The payment source definition.
    let paymentSource: PaymentSource

    enum CodingKeys: String, CodingKey {
        case processingInstruction = "processing_instruction"
        case applicationContext = "application_context"
        case paymentSource = "payment_source"
    }
}
