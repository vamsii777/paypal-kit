import Foundation

struct CardAttributes: Codable, Hashable {
    let customer: Customer?
    let vault: Vault?
    let verification: Verification?

    enum CodingKeys: String, CodingKey {
        case customer = "customer"
        case vault = "vault"
        case verification = "verification"
    }
}