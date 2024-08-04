import Foundation

// MARK: - Address

/// The address of the payer. Supports only the address_line_1, address_line_2, admin_area_1, admin_area_2, postal_code, and country_code properties. Also referred to as the billing address of the customer.
struct Address: Codable, Hashable {
    /// The first line of the address, such as number and street, for example, 173 Drury Lane. Needed for data entry, and Compliance and Risk checks. This field needs to pass the full address.
    let addressLine1: String?
    /// The second line of the address, for example, a suite or apartment number.
    let addressLine2: String?
    /// A city, town, or village. Smaller than admin_area_level_1.
    let adminArea2: String?
    /// The highest-level sub-division in a country, which is usually a province, state, or ISO-3166-2 subdivision. This data is formatted for postal delivery, for example, CA and not California. Value, by country, is:
    /// 
    /// UK. A county.
    /// US. A state.
    /// Canada. A province.
    /// Japan. A prefecture.
    /// Switzerland. A kanton.
    let adminArea1: String?
    /// The postal code, which is the ZIP code or equivalent. Typically required for countries with a postal code or an equivalent. See postal code.
    let postalCode: String?
    /// The 2-character ISO 3166-1 code that identifies the country or region.
    /// 
    /// Note: The country code for Great Britain is GB and not UK as used in the top-level domain names for that country. Use the C2 country code for China worldwide for comparable uncontrolled price (CUP) method, bank card, and cross-border transactions.
    let countryCode: String

    enum CodingKeys: String, CodingKey {
        case addressLine1 = "address_line_1"
        case addressLine2 = "address_line_2"
        case adminArea2 = "admin_area_2"
        case adminArea1 = "admin_area_1"
        case postalCode = "postal_code"
        case countryCode = "country_code"
    }
}