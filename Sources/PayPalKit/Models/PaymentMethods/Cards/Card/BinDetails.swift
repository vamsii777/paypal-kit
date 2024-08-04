import Foundation

// MARK: - Bin Details

/// Bank Identification Number (BIN) details used to fund a payment.
struct BinDetails: Codable, Hashable {
    /// The Bank Identification Number (BIN) signifies the number that is being used to identify the granular level details (except the PII information) of the card.
    let bin: String?
    /// The issuer of the card instrument.
    let issuingBank: String?
    /// The type of card product assigned to the BIN by the issuer. These values are defined by the issuer and may change over time. Some examples include: PREPAID_GIFT, CONSUMER, CORPORATE.
    let products: [String]?
    /// The two-character ISO-3166-1 country code of the bank.
    let binCountryCode: String?

    enum CodingKeys: String, CodingKey {
        case bin = "bin"
        case issuingBank = "issuing_bank"
        case products = "products"
        case binCountryCode = "bin_country_code"
    }
}