import Foundation

// MARK: - Venmo

/// Information needed to indicate that Venmo is being used to fund the payment.
struct Venmo: Codable, Hashable {
    /// Customizes the buyer experience during the approval process for payment with Venmo.
    ///
    /// Note: Partners and Marketplaces might configure `shipping_preference` during partner account setup, which overrides the request values.
    let experienceContext: ExperienceContext?
    /// The PayPal-generated ID for the saved Venmo wallet payment_source. This ID should be stored on the merchant's server so the saved payment source can be used for future transactions.
    let vaultID: String?
    /// The email address of the payer.
    let emailAddress: String?
    /// Additional attributes associated with the use of this wallet.
    let attributes: VenmoAttributes?

    let userName: String?

    let emailAddress: String?

    let accountId: String?

    let name: Name?

    let phoneNumber: PhoneNumber?

    let address: Address?

    enum CodingKeys: String, CodingKey {
        case experienceContext = "experience_context"
        case vaultID = "vault_id"
        case emailAddress = "email_address"
        case attributes = "attributes"
        case userName = "user_name"
        case emailAddress = "email_address"
        case accountId = "account_id"
        case name = "name"
        case phoneNumber = "phone_number"
        case address = "address"
    }
}

/// Additional attributes associated with the use of this wallet.
struct VenmoAttributes: Codable, Hashable {
    /// The details about a customer in PayPal's system of record.
    let customer: Customer?
    /// Attributes used to provide the instructions during vaulting of the Venmo Wallet.
    let vault: VenmoVault?
}
