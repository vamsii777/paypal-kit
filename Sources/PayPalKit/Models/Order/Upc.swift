import Foundation

struct Upc: Codable, Hashable {
    let type: UpcType
    let code: String

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case code = "code"
    }
}

enum UpcType: String, Codable, CaseIterable {
    case upcA = "UPC-A"
    case upcB = "UPC-B"
    case upcC = "UPC-C"
    case upcD = "UPC-D"
    case upcE = "UPC-E"
    case upc2 = "UPC-2"
    case upc5 = "UPC-5"
}