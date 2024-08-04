import Foundation

/// An array of items that the customer purchases from the merchant.
struct Item: Codable, Hashable {
    /// The item name or title.
    let name: String
    /// The item quantity. Must be a whole number.
    let quantity: String
    /// The detailed item description.
    let description: String?
    /// The stock keeping unit (SKU) for the item.
    let sku: String?
    /// The URL to the item being purchased. Visible to buyer and used in buyer experiences.
    let url: String?
    /// The item category type.
    let category: ItemCategory?
    /// The URL of the item's image. File type and size restrictions apply. An image that violates these restrictions will not be honored.
    let imageURL: String?
    /// The item price or rate per unit. If you specify unit_amount, purchase_units[].amount.breakdown.item_total is required. Must equal unit_amount * quantity for all items. unit_amount.value can not be a negative number.
    let unitAmount: Money
    /// The item tax for each unit. If tax is specified, purchase_units[].amount.breakdown.tax_total is required. Must equal tax * quantity for all items. tax.value can not be a negative number.
    let tax: Money?
    /// The Universal Product Code of the item.
    let upc: Upc?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case quantity = "quantity"
        case description = "description"
        case sku = "sku"
        case url = "url"
        case category = "category"
        case imageURL = "image_url"
        case unitAmount = "unit_amount"
        case tax = "tax"
        case upc = "upc"
    }
}

/// The item category type.
enum ItemCategory: String, Codable, CaseIterable {
    /// Goods that are stored, delivered, and used in their electronic format. This value is not currently supported for API callers that leverage the PayPal for Commerce Platform product.
    case digitalGoods = "DIGITAL_GOODS"
    /// A tangible item that can be shipped with proof of delivery.
    case physicalGoods = "PHYSICAL_GOODS"
    /// A contribution or gift for which no good or service is exchanged, usually to a not for profit organization.
    case donation = "DONATION"
}