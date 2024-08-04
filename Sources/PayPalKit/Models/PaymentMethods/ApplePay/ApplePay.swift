import Foundation

// MARK: - Apple Pay
struct ApplePay: Codable, Hashable {
    let id: String
    let token: String
    let name: String?
    let emailAddress: String?
    let phoneNumber: PhoneNumber?
    let card: Card?
    let attributes: Attributes?
    let vaultID: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case token = "token"
        case name = "name"
        case emailAddress = "email_address"
        case phoneNumber = "phone_number"
        case card = "card"
        case attributes = "attributes"
        case vaultID = "vault_id"
    }
}