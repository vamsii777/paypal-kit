import Foundation

// MARK: - BLIK

/// BLIK is a mobile payment system, created by Polish Payment Standard in order to allow millions of users to pay in shops, payout cash in ATMs and make online purchases and payments. More Details.
struct Blik: Codable, Hashable {
    /// The name of the account holder associated with this payment method.
    let name: String
    /// The two-character ISO 3166-1 country code.
    let countryCode: String
    /// The email address of the account holder associated with this payment method.
    let email: String?
    /// Customizes the payer experience during the approval process for the payment.
    let experienceContext: ExperienceContext?

    /// The level_0 integration flow object.
    let level0: Level0?

    /// The one-click integration flow object.
    let oneClick: OneClick?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case countryCode = "country_code"
        case email = "email"
        case experienceContext = "experience_context"
        case level0 = "level_0"
        case oneClick = "one_click"
    }
}