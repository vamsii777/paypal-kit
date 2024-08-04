import Foundation

// MARK: - Trustly

/// Trustly is a payment method that allows customers to shop and pay from their bank account. More Details.
struct Trustly: Codable, Hashable {
    /// The name of the account holder associated with this payment method.
    let name: String
    /// The two-character ISO 3166-1 country code.
    let countryCode: String
    /// Customizes the payer experience during the approval process for the payment.
    let experienceContext: ExperienceContext?

    let bic: String?

    let ibanLastChars: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case countryCode = "country_code"
        case experienceContext = "experience_context"
        case bic = "bic"
        case ibanLastChars = "iban_last_chars"
    }
}