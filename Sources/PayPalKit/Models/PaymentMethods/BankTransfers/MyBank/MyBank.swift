import Foundation

// MARK: - MyBank

/// MyBank is an e-authorisation solution which enables safe digital payments and identity authentication through a consumer’s own online banking portal or mobile application. More Details.
struct MyBank: Codable, Hashable {
    /// The name of the account holder associated with this payment method.
    let name: String
    /// The two-character ISO 3166-1 country code.
    let countryCode: String
    /// Customizes the payer experience during the approval process for the payment.
    let experienceContext: ExperienceContext?

    let ibanLastChars: String?
    let bic: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case countryCode = "country_code"
        case experienceContext = "experience_context"
        case ibanLastChars = "iban_last_chars"
        case bic = "bic"
    }
}