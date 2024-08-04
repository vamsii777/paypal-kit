import Foundation

/// An array of various fees, commissions, tips, or donations. This field is only applicable to merchants that been enabled for PayPal Complete Payments Platform for Marketplaces and Platforms capability.
struct PlatformFee: Codable, Hashable {
    /// The fee for this transaction.
    let amount: Money
    /// The recipient of the fee for this transaction. If you omit this value, the default is the API caller.
    let payee: Payee?

    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case payee = "payee"
    }
}