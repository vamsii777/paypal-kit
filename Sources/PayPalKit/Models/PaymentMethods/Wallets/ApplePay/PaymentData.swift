import Foundation

// MARK: - PaymentData

/// Apple Pay payment data object which contains the cryptogram, eci_indicator and other data.
struct PaymentData: Codable, Hashable {
    /// Online payment cryptogram, as defined by 3D Secure. The pattern is defined by an external party and supports Unicode.
    let cryptogram: String?
    /// ECI indicator, as defined by 3- Secure. The pattern is defined by an external party and supports Unicode.
    let eciIndicator: String?
    /// Encoded Apple Pay EMV Payment Structure used for payments in China. The pattern is defined by an external party and supports Unicode.
    let emvData: String?
    /// Bank Key encrypted Apple Pay PIN. The pattern is defined by an external party and supports Unicode.
    let pin: String?

    enum CodingKeys: String, CodingKey {
        case cryptogram = "cryptogram"
        case eciIndicator = "eci_indicator"
        case emvData = "emv_data"
        case pin = "pin"
    }
}