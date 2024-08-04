import Foundation

// MARK: - PaymentSource

/// The payment source definition.
struct PaymentSource: Codable, Hashable {
    /// The payment card to use to fund a payment. Can be a credit or debit card.
    ///
    /// Note: Passing card number, cvv and expiry directly via the API requires PCI SAQ D compliance.
    /// PayPal offers a mechanism by which you do not have to take on the PCI SAQ D burden by using hosted fields - refer to this Integration Guide.
    let card: Card?
    /// The tokenized payment source to fund a payment.
    let token: Token?
    /// Indicates that PayPal Wallet is the payment source. Main use of this selection is to provide additional instructions associated with this choice like vaulting.
    let paypal: PayPal?
    /// Bancontact is the most popular online payment in Belgium. More Details.
    let bancontact: Bancontact?
    /// BLIK is a mobile payment system, created by Polish Payment Standard in order to allow millions of users to pay in shops, payout cash in ATMs and make online purchases and payments. More Details.
    let blik: Blik?
    /// The eps transfer is an online payment method developed by many Austrian banks. More Details.
    let eps: EPS?
    /// Giropay is an Internet payment System in Germany, based on online banking. More Details.
    let giropay: Giropay?
    /// The Dutch payment method iDEAL is an online payment method that enables consumers to pay online through their own bank. More Details.
    let ideal: Ideal?
    /// MyBank is an e-authorisation solution which enables safe digital payments and identity authentication through a consumer’s own online banking portal or mobile application. More Details.
    let mybank: MyBank?
    /// P24 (Przelewy24) is a secure and fast online bank transfer service linked to all the major banks in Poland. More Details.
    let p24: P24?
    /// SOFORT Banking is a real-time bank transfer payment method that buyers use to transfer funds directly to merchants from their bank accounts. More Details.
    let sofort: Sofort?
    /// Trustly is a payment method that allows customers to shop and pay from their bank account. More Details.
    let trustly: Trustly?
    /// ApplePay payment source, allows buyer to pay using ApplePay, both on Web as well as on Native.
    let applePay: ApplePay?
    /// Google Pay payment source, allows buyer to pay using Google Pay.
    let googlePay: GooglePay?
    /// Information needed to indicate that Venmo is being used to fund the payment.
    let venmo: Venmo?

    enum CodingKeys: String, CodingKey {
        case card = "card"
        case token = "token"
        case paypal = "paypal"
        case bancontact = "bancontact"
        case blik = "blik"
        case eps = "eps"
        case giropay = "giropay"
        case ideal = "ideal"
        case mybank = "mybank"
        case p24 = "p24"
        case sofort = "sofort"
        case trustly = "trustly"
        case applePay = "apple_pay"
        case googlePay = "google_pay"
        case venmo = "venmo"
    }
}