import Foundation

struct AmountBreakdown: Codable, Hashable {
    let itemTotal: Money?
    let shipping: Money?
    let handling: Money?
    let taxTotal: Money?
    let insurance: Money?
    let shippingDiscount: Money?
    let discount: Money?

    enum CodingKeys: String, CodingKey {
        case itemTotal = "item_total"
        case shipping = "shipping"
        case handling = "handling"
        case taxTotal = "tax_total"
        case insurance = "insurance"
        case shippingDiscount = "shipping_discount"
        case discount = "discount"
    }
}