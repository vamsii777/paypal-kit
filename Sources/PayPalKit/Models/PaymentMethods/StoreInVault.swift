import Foundation

/// Defines how and when the payment source gets vaulted.
enum StoreInVault: String, Codable, CaseIterable {
    /// Defines that the payment_source will be vaulted only when at least one authorization or capture using that payment_source is successful.
    case onSuccess = "ON_SUCCESS"
}