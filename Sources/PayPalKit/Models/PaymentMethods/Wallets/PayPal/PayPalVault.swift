import Foundation

/// Attributes used to provide the instructions during vaulting of the PayPal Wallet.
struct PayPalVault: Codable, Hashable {
    /// Defines how and when the payment source gets vaulted.
    let storeInVault: StoreInVault?
    /// The description displayed to PayPal consumer on the approval flow for PayPal, as well as on the PayPal payment token management experience on PayPal.com.
    let description: String?
    /// Expected business/pricing model for the billing agreement.
    let usagePattern: String?
    /// The usage type associated with the PayPal payment token.
    let usageType: String
    /// The customer type associated with the PayPal payment token. This is to indicate whether the customer acting on the merchant / platform is either a business or a consumer.
    let customerType: CustomerType?
    /// Create multiple payment tokens for the same payer, merchant/platform combination. Use this when the customer has not logged in at merchant/platform. The payment token thus generated, can then also be used to create the customer account at merchant/platform. Use this also when multiple payment tokens are required for the same payer, different customer at merchant/platform. This helps to identify customers distinctly even though they may share the same PayPal account. This only applies to PayPal payment source.
    let permitMultiplePaymentTokens: Bool?

    enum CodingKeys: String, CodingKey {
        case storeInVault = "store_in_vault"
        case description = "description"
        case usagePattern = "usage_pattern"
        case usageType = "usage_type"
        case customerType = "customer_type"
        case permitMultiplePaymentTokens = "permit_multiple_payment_tokens"
    }
}
