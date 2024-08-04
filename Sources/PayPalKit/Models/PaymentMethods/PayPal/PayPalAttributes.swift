import Foundation


/// Additional attributes associated with the use of this wallet.
struct PayPalAttributes: Codable, Hashable {
    /// The details about a customer in PayPal's system of record.
    let customer: Customer?
    /// Attributes used to provide the instructions during vaulting of the Paypal.
    let vault: PayPalVault?
}
