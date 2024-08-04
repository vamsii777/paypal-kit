import Foundation

/// A 3rd party network token refers to a network token that the merchant provisions from and vaults with an external TSP (Token Service Provider) other than PayPal.
struct NetworkToken: Codable, Hashable {
    /// Third party network token number.
    let number: String
    /// An Encrypted one-time use value that's sent along with Network Token. This field is not required to be present for recurring transactions.
    let cryptogram: String?
    /// A TRID, or a Token Requestor ID, is an identifier used by merchants to request network tokens from card networks. A TRID is a precursor to obtaining a network token for a credit card primary account number (PAN), and will aid in enabling secure card on file (COF) payments and reducing fraud.
    let tokenRequestorID: String?
    /// The card expiration year and month, in Internet date format.
    let expiry: String
    /// Electronic Commerce Indicator (ECI). The ECI value is part of the 2 data elements that indicate the transaction was processed electronically. This should be passed on the authorization transaction to the Gateway/Processor.
    let eciFlag: EciFlag?

    enum CodingKeys: String, CodingKey {
        case number = "number"
        case cryptogram = "cryptogram"
        case tokenRequestorID = "token_requestor_id"
        case expiry = "expiry"
        case eciFlag = "eci_flag"
    }
}

/// Electronic Commerce Indicator (ECI). The ECI value is part of the 2 data elements that indicate the transaction was processed electronically. This should be passed on the authorization transaction to the Gateway/Processor.
enum EciFlag: String, Codable, CaseIterable {
    /// Mastercard non-3-D Secure transaction.
    case mastercardNon3dSecureTransaction = "MASTERCARD_NON_3D_SECURE_TRANSACTION"
    /// Mastercard attempted authentication transaction.
    case mastercardAttemptedAuthenticationTransaction = "MASTERCARD_ATTEMPTED_AUTHENTICATION_TRANSACTION"
    /// Mastercard fully authenticated transaction.
    case mastercardFullyAuthenticatedTransaction = "MASTERCARD_FULLY_AUTHENTICATED_TRANSACTION"
    /// VISA, AMEX, JCB, DINERS CLUB fully authenticated transaction.
    case fullyAuthenticatedTransaction = "FULLY_AUTHENTICATED_TRANSACTION"
    /// VISA, AMEX, JCB, DINERS CLUB attempted authentication transaction.
    case attemptedAuthenticationTransaction = "ATTEMPTED_AUTHENTICATION_TRANSACTION"
    /// VISA, AMEX, JCB, DINERS CLUB non-3-D Secure transaction.
    case non3dSecureTransaction = "NON_3D_SECURE_TRANSACTION"
}