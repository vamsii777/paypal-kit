import Foundation

// MARK: - EPS

/// The eps transfer is an online payment method developed by many Austrian banks. More Details.
struct EPS: Codable, Hashable {
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