import Foundation

/// Additional attributes associated with the use of this wallet.
struct AppleAttributes: Codable, Hashable {
    /// The details about a customer in PayPal's system of record.
    let customer: Customer?
    /// Attributes used to provide the instructions during vaulting of the Venmo Wallet.
    let vault: AppleVault?
}