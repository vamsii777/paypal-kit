import Foundation

// MARK: - P24

/// P24 (Przelewy24) is a secure and fast online bank transfer service linked to all the major banks in Poland. More Details.
struct P24: Codable, Hashable {
    /// The name of the account holder associated with this payment method.
    let name: String
    /// The email address of the account holder associated with this payment method.
    let email: String
    /// The two-character ISO 3166-1 country code.
    let countryCode: String
    /// Customizes the payer experience during the approval process for the payment.
    let experienceContext: ExperienceContext?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case email = "email"
        case countryCode = "country_code"
        case experienceContext = "experience_context"
    }
}