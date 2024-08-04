import Foundation

// MARK: - Payment Instruction
/// Any additional payment instructions to be consider during payment processing. This processing instruction is applicable for Capturing an order or Authorizing an Order.
struct PaymentInstruction: Codable, Hashable {
    /// An array of various fees, commissions, tips, or donations. This field is only applicable to merchants that been enabled for PayPal Complete Payments Platform for Marketplaces and Platforms capability.
    let platformFees: [PlatformFee]?

    /// This field is only enabled for selected merchants/partners to use and provides the ability to trigger a specific pricing rate/plan for a payment transaction. The list of eligible 'payee_pricing_tier_id' would be provided to you by your Account Manager. Specifying values other than the one provided to you by your account manager would result in an error.
    let payeePricingTierID: String?
    /// FX identifier generated returned by PayPal to be used for payment processing in order to honor FX rate (for eligible integrations) to be used when amount is settled/received into the payee account.
    let payeeReceivableFxRateID: String?
    /// The funds that are held payee by the marketplace/platform. This field is only applicable to merchants that been enabled for PayPal Complete Payments Platform for Marketplaces and Platforms capability.
    let disbursementMode: DisbursementMode?

    enum CodingKeys: String, CodingKey {
        case platformFees = "platform_fees"
        case payeePricingTierID = "payee_pricing_tier_id"
        case payeeReceivableFxRateID = "payee_receivable_fx_rate_id"
        case disbursementMode = "disbursement_mode"
    }
}

