import Foundation

/// Apple Pay tokenized credit card used to pay.
struct TokenizedCard: Codable, Hashable {
    /// The card holder's name as it appears on the card.
    let name: String?
    /// The primary account number (PAN) for the payment card.
    let number: String?
    /// The card expiration year and month, in Internet date format.
    let expiry: String?
    /// The payment card type.
    let type: CardType?
    /// The card brand or network. Typically used in the response.
    let brand: Brand?
    /// The billing address for this card. Supports only the address_line_1, address_line_2, admin_area_1, admin_area_2, postal_code, and country_code properties.
    let billingAddress: Address?
    /// Apple Pay payment data object which contains the cryptogram, eci_indicator and other data.
    let paymentData: PaymentData?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case number = "number"
        case expiry = "expiry"
        case type = "type"
        case brand = "brand"
        case billingAddress = "billing_address"
        case paymentData = "payment_data"
    }
}
