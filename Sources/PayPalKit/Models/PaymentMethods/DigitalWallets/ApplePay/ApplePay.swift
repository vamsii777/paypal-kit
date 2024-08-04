import Foundation

// MARK: - Apple Pay
struct ApplePay: Codable, Hashable {
    let id: String
    let storeCredential: StoredPaymentSource?
    let token: String
    let name: String?
    let emailAddress: String?
    let phoneNumber: PhoneNumber?
    let card: Card?
    let attributes: AppleAttributes?
    let decryptedToken: AppleDecryptedToken?
    let vaultID: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case storeCredential = "store_credential"
        case token = "token"
        case name = "name"
        case emailAddress = "email_address"
        case phoneNumber = "phone_number"
        case card = "card"
        case attributes = "attributes"
        case decryptedToken = "decrypted_token"
        case vaultID = "vault_id"
    }
}