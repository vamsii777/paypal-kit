import Foundation

// MARK: - PayPal

/// Indicates that PayPal Wallet is the payment source. Main use of this selection is to provide additional instructions associated with this choice like vaulting.
struct PayPal: Codable, Hashable {
    /// Customizes the payer experience during the approval process for payment with PayPal.
    ///
    /// Note: Partners and Marketplaces might configure `brand_name` and `shipping_preference` during partner account setup, which overrides the request values.
    let experienceContext: ExperienceContext?
    /// The PayPal billing agreement ID. References an approved recurring payment for goods or services.
    let billingAgreementID: String?
    /// The PayPal-generated ID for the payment_source stored within the Vault.
    let vaultID: String?
    /// The email address of the PayPal account holder.
    let emailAddress: String?
    /// The name of the PayPal account holder. Supports only the given_name and surname properties.
    let name: Name?
    /// The phone number of the customer. Available only when you enable the Contact Telephone Number option in the Profile & Settings for the merchant's PayPal account. The phone.phone_number supports only national_number.
    let phone: Phone?
    /// The birth date of the PayPal account holder in YYYY-MM-DD format.
    let birthDate: String?
    /// The tax information of the PayPal account holder. Required only for Brazilian PayPal account holder's. Both tax_id and tax_id_type are required.
    let taxInfo: TaxInfo?
    /// The address of the PayPal account holder. Supports only the address_line_1, address_line_2, admin_area_1, admin_area_2, postal_code, and country_code properties. Also referred to as the billing address of the customer.
    let address: Address?
    /// Additional attributes associated with the use of this wallet.
    let attributes: PayPalAttributes?

    enum CodingKeys: String, CodingKey {
        case experienceContext = "experience_context"
        case billingAgreementID = "billing_agreement_id"
        case vaultID = "vault_id"
        case emailAddress = "email_address"
        case name = "name"
        case phone = "phone"
        case birthDate = "birth_date"
        case taxInfo = "tax_info"
        case address = "address"
        case attributes = "attributes"
    }
}