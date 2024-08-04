import Foundation


/// Additional attributes associated with the use of this wallet.
struct PayPalAttributes: Codable, Hashable {
    /// The details about a customer in PayPal's system of record.
    let customer: Customer?
    /// Attributes used to provide the instructions during vaulting of the Paypal.
    let vault: PayPalVault?
}


protocol PayPalAttributesResponse: PayPalAttributes {
    var customer: Customer? { get }
    var vault: PayPalVault? { get }
    var cobrandedCard: [CobrandedCard]? { get }

     enum CodingKeys: String, CodingKey {
        case customer = "customer"
        case vault = "vault"
        case cobrandedCard = "cobranded_card"
     }
}

// Mark - CobrandedCard
/// The details about a cobranded card in PayPal's system of record.
/// 
struct CobrandedCard: Codable, Hashable {
    var label: String?
    var payee: Payee?
    var amount: Money?
}