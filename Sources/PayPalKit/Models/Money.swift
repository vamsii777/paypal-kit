import Foundation 

struct Money: Codable, Hashable {
    let currencyCode: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case currencyCode = "currency_code"
        case value = "value"
    }
}