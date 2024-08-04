import Foundation

/// The funds that are held payee by the marketplace/platform. This field is only applicable to merchants that been enabled for PayPal Complete Payments Platform for Marketplaces and Platforms capability.
enum DisbursementMode: String, Codable, CaseIterable {
    /// The funds are released to the merchant immediately.
    case instant = "INSTANT"
    /// The funds are held for a finite number of days. The actual duration depends on the region and type of integration. You can release the funds through a referenced payout. Otherwise, the funds disbursed automatically after the specified duration.
    case delayed = "DELAYED"
}