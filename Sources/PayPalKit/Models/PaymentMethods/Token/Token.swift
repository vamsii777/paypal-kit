import Foundation

/// The tokenized payment source to fund a payment.
struct Token: Codable, Hashable {
    /// The PayPal-generated ID for the token.
    let id: String
    /// The tokenization method that generated the ID.
    let type: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
    }
}