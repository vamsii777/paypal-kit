import Foundation


/// The level 3 card processing data collections, If your merchant account has been configured for Level 3 processing this field will be passed to the processor on your behalf. Please contact your PayPal Technical Account Manager to define level 3 data for your business.
struct Level3: Codable, Hashable {
    /// Use this field to specify the postal code of the shipping location.
    let shipsFromPostalCode: String?
    /// A list of the items that were purchased with this payment. If your merchant account has been configured for Level 3 processing this field will be passed to the processor on your behalf.
    let lineItems: [LineItem]?
    /// Use this field to break down the discount amount included in the total purchase amount. The value provided here will not add to the total purchase amount. The value cannot be negative.
    let discountAmount: Money?
    /// The address of the person to whom to ship the items. Supports only the address_line_1, address_line_2, admin_area_1, admin_area_2, postal_code, and country_code properties.
    let shippingAddress: Address?

    enum CodingKeys: String, CodingKey {
        case shipsFromPostalCode = "ships_from_postal_code"
        case lineItems = "line_items"
        case discountAmount = "discount_amount"
        case shippingAddress = "shipping_address"
    }
}
