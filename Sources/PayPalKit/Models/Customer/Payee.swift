import Foundation

/// The merchant who receives payment for this transaction.
struct Payee: Codable, Hashable {
    /// The email address of merchant.
    let emailAddress: String?
    /// The encrypted PayPal account ID of the merchant.
    let merchantID: String?

    enum CodingKeys: String, CodingKey {
        case emailAddress = "email_address"
        case merchantID = "merchant_id"
    }
}