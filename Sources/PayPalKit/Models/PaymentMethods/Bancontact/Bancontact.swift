import Foundation

// MARK: - Bancontact

/// Bancontact is the most popular online payment in Belgium. More Details.
struct Bancontact: Codable, Hashable {
    /// The name of the account holder associated with this payment method.
    let name: String
    /// The two-character ISO 3166-1 country code.
    let countryCode: String
    /// Customizes the payer experience during the approval process for the payment.
    let experienceContext: ExperienceContext?

    let cardLastDigits: String?

    let bic: String?

    let ibanLastChars: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case countryCode = "country_code"
        case experienceContext = "experience_context"
        case cardLastDigits = "card_last_digits"
        case bic = "bic"
        case ibanLastChars = "iban_last_chars"
    }
}