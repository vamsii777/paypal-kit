import Foundation

/// The total order amount with an optional breakdown that provides details, such as the total item amount, total tax amount, shipping, handling, insurance, and discounts, if any.
///
/// If you specify `amount.breakdown`, the amount equals `item_total` plus `tax_total` plus `shipping` plus `handling` plus `insurance` minus `shipping_discount` minus `discount`.
/// The amount must be a positive number. The `amount.value` field supports up to 15 digits preceding the decimal. For a list of supported currencies, decimal precision, and maximum charge amount, see the PayPal REST APIs Currency Codes.
struct Amount: Codable, Hashable {
    /// The three-character ISO-4217 currency code that identifies the currency.
    let currencyCode: String
    /// The value, which might be:
    ///
    /// - An integer for currencies like JPY that are not typically fractional.
    /// - A decimal fraction for currencies like TND that are subdivided into thousandths.
    /// For the required number of decimal places for a currency code, see Currency Codes.
    let value: String
    /// The breakdown of the amount. Breakdown provides details such as total item amount, total tax amount, shipping, handling, insurance, and discounts, if any.
    let breakdown: AmountBreakdown?

    enum CodingKeys: String, CodingKey {
        case currencyCode = "currency_code"
        case value = "value"
        case breakdown = "breakdown"
    }
}
