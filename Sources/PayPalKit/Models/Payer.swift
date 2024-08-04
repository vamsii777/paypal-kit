import Foundation

/// The customer who approves and pays for the order. The customer is also known as the payer. 
struct Payer: Codable, Hashable {
    /// The email address of the payer.
    let emailAddress: String?
    /// The PayPal-assigned ID for the payer.
    let payerID: String?
    /// The name of the payer. Supports only the given_name and surname properties.
    let name: Name?
    /// The phone number of the customer. Available only when you enable the Contact Telephone Number option in the Profile & Settings for the merchant's PayPal account. The phone.phone_number supports only national_number.
    let phone: Phone?
    /// The birth date of the payer in YYYY-MM-DD format.
    let birthDate: String?
    /// The tax information of the payer. Required only for Brazilian payer's. Both tax_id and tax_id_type are required.
    let taxInfo: TaxInfo?
    /// The address of the payer. Supports only the address_line_1, address_line_2, admin_area_1, admin_area_2, postal_code, and country_code properties. Also referred to as the billing address of the customer.
    let address: Address?

    enum CodingKeys: String, CodingKey {
        case emailAddress = "email_address"
        case payerID = "payer_id"
        case name = "name"
        case phone = "phone"
        case birthDate = "birth_date"
        case taxInfo = "tax_info"
        case address = "address"
    }
}

/// The name of the payer. Supports only the given_name and surname properties.
struct Name: Codable, Hashable {
    /// When the party is a person, the party's given, or first, name.
    let givenName: String?
    /// When the party is a person, the party's surname or family name. Also known as the last name. Required when the party is a person. Use also to store multiple surnames including the matronymic, or mother's, surname.
    let surname: String?

    /// When the party is a person, the party's full name.
    let fullName: String?

    enum CodingKeys: String, CodingKey {
        case givenName = "given_name"
        case surname = "surname"
        case fullName = "full_name"
    }
}

/// The phone number of the customer. Available only when you enable the Contact Telephone Number option in the Profile & Settings for the merchant's PayPal account. The phone.phone_number supports only national_number.
struct Phone: Codable, Hashable {
    /// The phone type.
    let phoneType: String?
    /// The phone number, in its canonical international E.164 numbering plan format. Supports only the national_number property.
    let phoneNumber: PhoneNumber?

    enum CodingKeys: String, CodingKey {
        case phoneType = "phone_type"
        case phoneNumber = "phone_number"
    }
}

/// The phone number, in its canonical international E.164 numbering plan format. Supports only the national_number property.
struct PhoneNumber: Codable, Hashable {
    /// The national number, in its canonical international E.164 numbering plan format. The combined length of the country calling code (CC) and the national number must not be greater than 15 digits. The national number consists of a national destination code (NDC) and subscriber number (SN).
    let nationalNumber: String

    enum CodingKeys: String, CodingKey {
        case nationalNumber = "national_number"
    }
}