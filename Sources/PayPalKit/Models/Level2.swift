import Foundation

/// The level 2 card processing data collections. If your merchant account has been configured for Level 2 processing this field will be passed to the processor on your behalf. Please contact your PayPal Technical Account Manager to define level 2 data for your business.
struct Level2: Codable, Hashable {
    /// Use this field to pass a purchase identification value of up to 127 ASCII characters. The length of this field will be adjusted to meet network specifications (25chars for Visa and Mastercard, 17chars for Amex), and the original invoice ID will still be displayed in your existing reports.
    let invoiceID: String?
    /// Use this field to break down the amount of tax included in the total purchase amount. The value provided here will not add to the total purchase amount. The value can't be negative, and in most cases, it must be greater than zero in order to qualify for lower interchange rates. Value, by country, is:
    ///
    /// UK. A county.
    /// US. A state.
    /// Canada. A province.
    /// Japan. A prefecture.
    /// Switzerland. A kanton.
    let taxTotal: Money?

    enum CodingKeys: String, CodingKey {
        case invoiceID = "invoice_id"
        case taxTotal = "tax_total"
    }
}
