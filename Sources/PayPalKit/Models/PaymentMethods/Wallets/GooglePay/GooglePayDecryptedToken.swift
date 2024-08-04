import Foundation
// MARK: - Google Pay Decrypted Token

/// The decrypted payload details for the Google Pay token.
struct GooglePayDecryptedToken: Codable, Hashable {
    /// A unique ID that identifies the message in case it needs to be revoked or located at a later time.
    let messageID: String?
    /// Date and time at which the message expires as UTC milliseconds since epoch. Integrators should reject any message that's expired.
    let messageExpiration: String?
    /// The type of the payment credential. Currently, only CARD is supported.
    let paymentMethod: GooglePayPaymentMethod
    /// Authentication Method which is used for the card transaction.
    let authenticationMethod: AuthenticationMethod
    /// Base-64 cryptographic identifier used by card schemes to validate the token verification result. This is a conditionally required field if `authentication_method` is `CRYPTOGRAM_3DS`.
    let cryptogram: String?
    /// Electronic Commerce Indicator may not always be present. It is only returned for tokens on the Visa card network. This value is passed through in the payment authorization request.
    let eciIndicator: String?

    enum CodingKeys: String, CodingKey {
        case messageID = "message_id"
        case messageExpiration = "message_expiration"
        case paymentMethod = "payment_method"
        case authenticationMethod = "authentication_method"
        case cryptogram = "cryptogram"
        case eciIndicator = "eci_indicator"
    }
}

/// Authentication Method which is used for the card transaction.
enum AuthenticationMethod: String, Codable, CaseIterable {
    /// This authentication method is associated with payment cards stored on file with the user's Google Account. Returned payment data includes primary account number (PAN) with the expiration month and the expiration year.
    case panOnly = "PAN_ONLY"
    /// Returned payment data includes a 3-D Secure (3DS) cryptogram generated on the device. -> If authentication_method=CRYPTOGRAM, it is required that 'cryptogram' parameter in the request has a valid 3-D Secure (3DS) cryptogram generated on the device.
    case cryptogram3ds = "CRYPTOGRAM_3DS"
}