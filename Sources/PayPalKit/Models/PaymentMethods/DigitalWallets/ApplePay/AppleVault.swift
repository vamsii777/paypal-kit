import Foundation

struct AppleVault: Codable, Hashable {
    /// Defines how and when the payment source gets vaulted.
    let storeInVault: StoreInVault

    enum CodingKeys: String, CodingKey {
        case storeInVault = "store_in_vault"
    }

}