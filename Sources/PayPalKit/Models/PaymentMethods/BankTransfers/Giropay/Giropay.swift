import Foundation

// MARK: - Giropay

/// Giropay is an Internet payment System in Germany, based on online banking. More Details.
struct Giropay: Codable, Hashable {
    /// The name of the account holder associated with this payment method.
    let name: String
    /// The two-character ISO 3166-1 country code.
    let countryCode: String
    /// Customizes the payer experience during the approval process for the payment.
    let experienceContext: ExperienceContext?

    let bic: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case countryCode = "country_code"
        case experienceContext = "experience_context"
        case bic = "bic"
    }
}