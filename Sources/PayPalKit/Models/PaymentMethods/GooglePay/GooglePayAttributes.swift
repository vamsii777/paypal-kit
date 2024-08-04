import Foundation 

// MARK: - GooglePay Attributes

struct GooglePayAttributes: Codable, Hashable {
    let verification: Verification?

    enum CodingKeys: String, CodingKey {
        case verification = "verification"
    }
}