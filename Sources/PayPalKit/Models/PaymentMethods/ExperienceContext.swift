import Foundation


/// Note: Partners and Marketplaces might configure `brand_name` and `shipping_preference` during partner account setup, which overrides the request values.
struct ExperienceContext: Codable, Hashable {
    /// The label that overrides the business name in the PayPal account on the PayPal site.
    let brandName: String?
    /// The type of landing page to show on the PayPal site for customer checkout.
    let landingPage: LandingPage?
    /// The shipping preference:
    ///
    /// - Displays the shipping address to the customer.
    /// - Enables the customer to choose an address on the PayPal site.
    /// - Restricts the customer from changing the address during the payment-approval process.
    /// .
    let shippingPreference: ShippingPreference?
    /// Configures a Continue or Pay Now checkout flow.
    let userAction: UserAction?
    /// The URL where the customer is redirected after the customer approves the payment.
    let returnURL: String?
    /// The URL where the customer is redirected after the customer cancels the payment.
    let cancelURL: String?
    /// The BCP 47-formatted locale of pages that the PayPal payment experience shows. PayPal supports a five-character code. For example, da-DK, he-IL, id-ID, ja-JP, no-NO, pt-BR, ru-RU, sv-SE, th-TH, zh-CN, zh-HK, or zh-TW.
    let locale: String?
    /// The customer and merchant payment preferences.
    let paymentMethod: PaymentMethod?

    enum CodingKeys: String, CodingKey {
        case brandName = "brand_name"
        case landingPage = "landing_page"
        case shippingPreference = "shipping_preference"
        case userAction = "user_action"
        case returnURL = "return_url"
        case cancelURL = "cancel_url"
        case locale = "locale"
        case paymentMethod = "payment_method"
    }
}


/// The type of landing page to show on the PayPal site for customer checkout. The fields in `application_context` are now available in the `experience_context` object under the `payment_source` which supports them (eg. `payment_source.paypal.experience_context.landing_page`). Please specify this field in the `experience_context` object instead of the `application_context` object.
enum LandingPage: String, Codable, CaseIterable {
    /// When the customer clicks PayPal Checkout, the customer is redirected to a page to log in to PayPal and approve the payment.
    case login = "LOGIN"
    /// When the customer clicks PayPal Checkout, the customer is redirected to a page to enter credit or debit card and other relevant billing information required to complete the purchase.
    case billing = "BILLING"
    /// When the customer clicks PayPal Checkout, the customer is redirected to a page to log in to PayPal and approve the payment.
    case guestCheckout = "GUEST_CHECKOUT"
    /// When the customer clicks PayPal Checkout, the customer is redirected to either a page to log in to PayPal and approve the payment or to a page to enter credit or debit card and other relevant billing information required to complete the purchase, depending on their previous interaction with PayPal.
    case noPreference = "NO_PREFERENCE"
}

/// The merchant-preferred payment methods.
enum PaymentMethodPreferrence: String, Codable, CaseIterable {
    /// Accepts any type of payment from the customer.
    case unrestricted = "UNRESTRICTED"
    /// Accepts only immediate payment from the customer. For example, credit card, PayPal balance, or instant ACH. Ensures that at the time of capture, the payment does not have the pending status.
    case immediatePaymentRequired = "IMMEDIATE_PAYMENT_REQUIRED"
}

/// The shipping preference:
///
/// - Displays the shipping address to the customer.
/// - Enables the customer to choose an address on the PayPal site.
/// - Restricts the customer from changing the address during the payment-approval process.
/// . The fields in `application_context` are now available in the `experience_context` object under the `payment_source` which supports them (eg. `payment_source.paypal.experience_context.shipping_preference`). Please specify this field in the `experience_context` object instead of the `application_context` object.
enum ShippingPreference: String, Codable, CaseIterable {
    /// Use the customer-provided shipping address on the PayPal site.
    case getFromFile = "GET_FROM_FILE"
    /// Redact the shipping address from the PayPal site. Recommended for digital goods.
    case noShipping = "NO_SHIPPING"
    /// Use the merchant-provided address. The customer cannot change this address on the PayPal site.
    case setProvidedAddress = "SET_PROVIDED_ADDRESS"
}