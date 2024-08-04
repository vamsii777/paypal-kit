import Foundation

// MARK: - Google Pay

/// Google Pay payment source, allows buyer to pay using Google Pay.
struct GooglePay: Codable, Hashable {
    /// Name on the account holder associated with Google Pay.
    let name: String?
    /// The email address of the account holder associated with Google Pay.
    let emailAddress: String?
    /// The phone number of account holder, in its canonical international E.164 numbering plan format. Supports only the national_number property.
    let phoneNumber: PhoneNumber?
    /// The payment card information.
    let card: JSONAny?
    /// The decrypted payload details for the Google Pay token.
    let decryptedToken: DecryptedToken?
    /// Additional attributes associated with the use of this card.
    let attributes: Attributes?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case emailAddress = "email_address"
        case phoneNumber = "phone_number"
        case card = "card"
        case decryptedToken = "decrypted_token"
        case attributes = "attributes"
    }
}