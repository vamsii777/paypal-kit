import Foundation

/// The one-click integration flow object.
struct OneClick: Codable, Hashable {
    /// The 6-digit code used to authenticate a consumer within BLIK.
    let authCode: String?
    /// The merchant generated, unique reference serving as a primary identifier for accounts connected between Blik and a merchant.
    let consumerReference: String
    /// A bank defined identifier used as a display name to allow the payer to differentiate between multiple registered bank accounts.
    let aliasLabel: String?
    /// A Blik-defined identifier for a specific Blik-enabled bank account that is associated with a given merchant. Used only in conjunction with a Consumer Reference.
    let aliasKey: String?

    enum CodingKeys: String, CodingKey {
        case authCode = "auth_code"
        case consumerReference = "consumer_reference"
        case aliasLabel = "alias_label"
        case aliasKey = "alias_key"
    }
}