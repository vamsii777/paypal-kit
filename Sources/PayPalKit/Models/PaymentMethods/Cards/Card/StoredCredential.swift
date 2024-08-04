import Foundation

struct StoredCredential: Codable, Hashable {
    /// The person or party who initiated or triggered the payment.
    let paymentInitiator: PaymentInitiator
    /// Indicates the type of the stored payment_source payment.
    let paymentType: PaymentType
    /// Indicates if this is a first or subsequent payment using a stored payment source (also referred to as stored credential or card on file).
    let usage: Usage?
    /// Reference values used by the card network to identify a transaction.
    let previousNetworkTransactionReference: PreviousNetworkTransactionReference?

    enum CodingKeys: String, CodingKey {
        case paymentInitiator = "payment_initiator"
        case paymentType = "payment_type"
        case usage = "usage"
        case previousNetworkTransactionReference = "previous_network_transaction_reference"
    }
}