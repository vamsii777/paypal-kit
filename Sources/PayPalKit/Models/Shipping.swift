import Foundation 

/// The name and address of the person to whom to ship the items.
struct Shipping: Codable, Hashable {
    /// A classification for the method of purchase fulfillment (e.g shipping, in-store pickup, etc). Either type or options may be present, but not both.
    let type: ShippingType?
    /// An array of shipping options that the payee or merchant offers to the payer to ship or pick up their items.
    let options: [ShippingOption]?
    /// The name of the person to whom to ship the items. Supports only the full_name property.
    let name: Name?
    /// The address of the person to whom to ship the items. Supports only the address_line_1, address_line_2, admin_area_1, admin_area_2, postal_code, and country_code properties.
    let address: Address?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case options = "options"
        case name = "name"
        case address = "address"
    }
}

/// A classification for the method of purchase fulfillment (e.g shipping, in-store pickup, etc). Either type or options may be present, but not both.
enum ShippingType: String, Codable, CaseIterable {
    /// The payer intends to receive the items at a specified address.
    case shipping = "SHIPPING"
    /// DEPRECATED. Please use "PICKUP_FROM_PERSON" instead.
    case pickupInPerson = "PICKUP_IN_PERSON"
    /// The payer intends to pick up the item(s) from the payee's physical store. Also termed as BOPIS, "Buy Online, Pick-up in Store". Seller protection is provided with this option.
    case pickupInStore = "PICKUP_IN_STORE"
    /// The payer intends to pick up the item(s) from the payee in person. Also termed as BOPIP, "Buy Online, Pick-up in Person". Seller protection is not available, since the payer is receiving the item from the payee in person, and can validate the item prior to payment.
    case pickupFromPerson = "PICKUP_FROM_PERSON"
}

/// An array of shipping options that the payee or merchant offers to the payer to ship or pick up their items.
struct ShippingOption: Codable, Hashable {
    /// A unique ID that identifies a payer-selected shipping option.
    let id: String
    /// A description that the payer sees, which helps them choose an appropriate shipping option. For example, Free Shipping, USPS Priority Shipping, Expédition prioritaire USPS, or USPS yōuxiān fā huò. Localize this description to the payer's locale.
    let label: String
    /// If the API request sets selected = true, it represents the shipping option that the payee or merchant expects to be pre-selected for the payer when they first view the shipping.options in the PayPal Checkout experience. As part of the response if a shipping.option contains selected=true, it represents the shipping option that the payer selected during the course of checkout with PayPal. Only one shipping.option can be set to selected=true.
    let selected: Bool
    /// A classification for the method of purchase fulfillment.
    let type: ShippingOptionType?
    /// The shipping cost for the selected option.
    let amount: Money?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case label = "label"
        case selected = "selected"
        case type = "type"
        case amount = "amount"
    }
}

/// A classification for the method of purchase fulfillment.
enum ShippingOptionType: String, Codable, CaseIterable {
    /// The payer intends to receive the items at a specified address.
    case shipping = "SHIPPING"
    /// DEPRECATED. To ensure that seller protection is correctly assigned, please use 'PICKUP_IN_STORE' or 'PICKUP_FROM_PERSON' instead. Currently, this field indicates that the payer intends to pick up the items at a specified address (ie. a store address).
    case pickup = "PICKUP"
    /// The payer intends to pick up the item(s) from the payee's physical store. Also termed as BOPIS, "Buy Online, Pick-up in Store". Seller protection is provided with this option.
    case pickupInStore = "PICKUP_IN_STORE"
    /// The payer intends to pick up the item(s) from the payee in person. Also termed as BOPIP, "Buy Online, Pick-up in Person". Seller protection is not available, since the payer is receiving the item from the payee in person, and can validate the item prior to payment.
    case pickupFromPerson = "PICKUP_FROM_PERSON"
}