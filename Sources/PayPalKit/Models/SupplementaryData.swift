import Foundation

// MARK: - Supplementary Data
struct SupplementaryData: Codable, Hashable {
    let card: Card?

    enum CodingKeys: String, CodingKey {
        case card = "card"
    }
}