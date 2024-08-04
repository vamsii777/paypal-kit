import Foundation

/// A list of the items that were purchased with this payment. If your merchant account has been configured for Level 3 processing this field will be passed to the processor on your behalf.
struct LineItem: Codable, Hashable {
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
    /// The URL of the item's image. File type and size restrictions apply. An image that violates these restrictions will not be honored.
    let imageURL: String?
    /// The Universal Product Code of the item.
    let upc: Upc?
    /// Code used to classify items purchased and track the total amount spent across various categories of products and services. Different corporate purchasing organizations may use different standards, but the United Nations Standard Products and Services Code (UNSPSC) is frequently used.
    let commodityCode: String?
    /// Unit of measure is a standard used to express the magnitude of a quantity in international trade. Most commonly used (but not limited to) examples are: Acre (ACR), Ampere (AMP), Centigram (CGM), Centimetre (CMT), Cubic inch (INQ), Cubic metre (MTQ), Fluid ounce (OZA), Foot (FOT), Hour (HUR), Item (ITM), Kilogram (KGM), Kilometre (KMT), Kilowatt (KWT), Liquid gallon (GLL), Liter (LTR), Pounds (LBS), Square foot (FTK).
    let unitOfMeasure: String?
    /// The item price or rate per unit. Must equal unit_amount * quantity for all items. unit_amount.value can not be a negative number.
    let unitAmount: Money
    /// The item tax for each unit. Must equal tax * quantity for all items. tax.value can not be a negative number.
    let tax: Money?
    /// Use this field to break down the discount amount included in the total purchase amount. The value provided here will not add to the total purchase amount. The value cannot be negative.
    let discountAmount: Money?
    /// The subtotal for all items. Must equal the sum of (items[].unit_amount * items[].quantity) for all items. item_total.value can not be a negative number.
    let totalAmount: Money?
    /// Use this field to break down the shipping cost included in the total purchase amount. The value provided here will not add to the total purchase amount. The value cannot be negative.
    let shippingAmount: Money?
    /// Use this field to break down the duty amount included in the total purchase amount. The value provided here will not add to the total purchase amount. The value cannot be negative.
    let dutyAmount: Money?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case quantity = "quantity"
        case description = "description"
        case sku = "sku"
        case url = "url"
        case imageURL = "image_url"
        case upc = "upc"
        case commodityCode = "commodity_code"
        case unitOfMeasure = "unit_of_measure"
        case unitAmount = "unit_amount"
        case tax = "tax"
        case discountAmount = "discount_amount"
        case totalAmount = "total_amount"
        case shippingAmount = "shipping_amount"
        case dutyAmount = "duty_amount"
    }
}
