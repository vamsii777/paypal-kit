import Foundation

enum Intent: String, Codable, CaseIterable {
    case capture = "CAPTURE"
    case authorize = "AUTHORIZE"
}