import Foundation

struct Card: Codable, Hashable {
    let name: String?
    let number: String?
    let securityCode: String?
    let expiry: String?
    let billingAddress: Address?
    let lastDigits: String?
    let availableNetworks: [AvailableNetwork]?
    let fromRequest: FromRequest?
    let brand: Brand?
    let type: CardType?
    let authenticationResult: AuthenticationResult?
    let level2: Level2?
    let level3: Level3?
    let attributes: CardAttributes?
    let storedCredential: StoredCredential?
    let vaultID: String?
    let networkToken: NetworkToken?
    let expirenceContext: ExperienceContext?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case number = "number"
        case securityCode = "security_code"
        case expiry = "expiry"
        case lastDigits = "last_digits"
        case availableNetworks = "available_networks"
        case fromRequest = "from_request"
        case brand = "brand"
        case type = "type"
        case authenticationResult = "authentication_result"
        case level2 = "level_2"
        case level3 = "level_3"
        case attributes = "attributes"
        case storedCredential = "stored_credential"
        case vaultID = "vault_id"
        case networkToken = "network_token"
        case expirenceContext = "experience_context"
    }
}

enum AvailableNetwork: String, Codable, CaseIterable {
    case visa = "VISA"
    case mastercard = "MASTERCARD"
    case discover = "DISCOVER"
    case amex = "AMEX"
    case solo = "SOLO"
    case jcb = "JCB"
    case star = "STAR"
    case delta = "DELTA"
    case `switch` = "SWITCH"
    case maestro = "MAESTRO"
    case cbNationale = "CB_NATIONALE"
    case configoga = "CONFIGOGA"
    case confidis = "CONFIDIS"
    case electron = "ELECTRON"
    case cetelem = "CETELEM"
    case chinaUnionPay = "CHINA_UNION_PAY"
    case diners = "DINERS"
    case elo = "ELO"
    case hiper = "HIPER"
    case hipercard = "HIPERCARD"
    case rupay = "RUPAY"
    case ge = "GE"
    case synchrony = "SYNCHRONY"
    case eftpos = "EFTPOS"
    case unknown = "UNKNOWN"
}

struct AuthenticationResult: Codable, Hashable {
    let liabilityShift: LiabilityShift?
    let threeDSecure: ThreeDSecure?

    enum CodingKeys: String, CodingKey {
        case liabilityShift = "liability_shift"
        case threeDSecure = "three_d_secure"
    }
}

enum LiabilityShift: String, Codable, CaseIterable {
    case no = "NO"
    case possible = "POSSIBLE"
    case unknown = "UNKNOWN"
}

struct ThreeDSecure: Codable, Hashable {
    let authenticationStatus: AuthenticationStatus?
    let enrollmentStatus: EnrollmentStatus?

    enum CodingKeys: String, CodingKey {
        case authenticationStatus = "authentication_status"
        case enrollmentStatus = "enrollment_status"
    }
}

enum AuthenticationStatus: String, Codable, CaseIterable {
    case y = "Y"
    case n = "N"
    case u = "U"
    case a = "A"
    case c = "C"
    case r = "R"
    case d = "D"
    case i = "I"
}

enum EnrollmentStatus: String, Codable, CaseIterable {
    case y = "Y"
    case n = "N"
    case u = "U"
    case b = "B"
}

enum Brand: String, Codable, CaseIterable {
    case visa = "VISA"
    case mastercard = "MASTERCARD"
    case discover = "DISCOVER"
    case amex = "AMEX"
    case solo = "SOLO"
    case jcb = "JCB"
    case star = "STAR"
    case delta = "DELTA"
    case `switch` = "SWITCH"
    case maestro = "MAESTRO"
    case cbNationale = "CB_NATIONALE"
    case configoga = "CONFIGOGA"
    case confidis = "CONFIDIS"
    case electron = "ELECTRON"
    case cetelem = "CETELEM"
    case chinaUnionPay = "CHINA_UNION_PAY"
    case diners = "DINERS"
    case elo = "ELO"
    case hiper = "HIPER"
    case hipercard = "HIPERCARD"
    case rupay = "RUPAY"
    case ge = "GE"
    case synchrony = "SYNCHRONY"
    case eftpos = "EFTPOS"
    case unknown = "UNKNOWN"
}

struct FromRequest: Codable, Hashable {
    let lastDigits: String?
    let expiry: String?

    enum CodingKeys: String, CodingKey {
        case lastDigits = "last_digits"
        case expiry = "expiry"
    }
}

enum CardType: String, Codable, CaseIterable {
    case credit = "CREDIT"
    case debit = "DEBIT"
    case prepaid = "PREPAID"
    case store = "STORE"
    case unknown = "UNKNOWN"
}

/// Additional attributes associated with the use of this wallet.
struct Attributes: Codable, Hashable {
    /// The details about a customer in PayPal's system of record.
    let customer: Customer?
    /// Attributes used to provide the instructions during vaulting of the Venmo Wallet.
    let vault: Vault?
}

struct Vault: Codable, Hashable {
    let id: String?
    let status: Status?
    let links: [Link]?
    let customer: Customer?
}

/// The details about a customer in PayPal's system of record.
struct Customer: Codable, Hashable {
    /// The unique ID for a customer generated by PayPal.
    let id: String?
    /// Email address of the buyer as provided to the merchant or on file with the merchant. Email Address is required if you are processing the transaction using PayPal Guest Processing which is offered to select partners and merchants. For all other use cases we do not expect partners/merchant to send email_address of their customer.
    let emailAddress: String?

    let phone: CardPhone?

    let merchantCustomerID: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case emailAddress = "email_address"
        case merchantCustomerID = "merchant_customer_id"
    }
}

/// The phone number of the customer. Available only when you enable the Contact Telephone Number option in the Profile & Settings for the merchant's PayPal account. The phone.phone_number supports only national_number.
struct CardPhone: Codable, Hashable {
    /// The phone type.
    let phoneType: String?
    /// The phone number, in its canonical international E.164 numbering plan format. Supports only the national_number property.
    let phoneNumber: PhoneNumber

    enum CodingKeys: String, CodingKey {
        case phoneType = "phone_type"
        case phoneNumber = "phone_number"
    }
}

enum Status: String, Codable, CaseIterable {
    case vaulted = "VAULTED"
    case created = "CREATED"
    case approved = "APPROVED"
}

struct Link: Codable, Hashable {
    let href: String
    let rel: String
    let method: HTTPMethod?

    enum CodingKeys: String, CodingKey {
        case href = "href"
        case rel = "rel"
        case method = "method"
    }
}

enum HTTPMethod: String, Codable, CaseIterable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case head = "HEAD"
    case connect = "CONNECT"
    case options = "OPTIONS"
    case patch = "PATCH"
}