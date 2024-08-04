import Foundation

// MARK: - Ideal

/// The Dutch payment method iDEAL is an online payment method that enables consumers to pay online through their own bank. More Details.
struct Ideal: Codable, Hashable {
    /// The name of the account holder associated with this payment method.
    let name: String
    /// The two-character ISO 3166-1 country code.
    let countryCode: String
    /// The bank identification code (BIC).
    let bic: String?
    /// Customizes the payer experience during the approval process for the payment.
    let experienceContext: ExperienceContext?

    let bic: String?

    let ibanLastChars: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case countryCode = "country_code"
        case bic = "bic"
        case experienceContext = "experience_context"
        case ibanLastChars = "iban_last_chars"
        case bic = "bic"
    }
}