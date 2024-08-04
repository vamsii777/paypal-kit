import Foundation

/// The level_0 integration flow object.
struct Level0: Codable, Hashable {
    /// The 6-digit code used to authenticate a consumer within BLIK.
    let authCode: String

    enum CodingKeys: String, CodingKey {
        case authCode = "auth_code"
    }
}