import Foundation

struct AccountID: Codable, Hashable {
    let string: String

    // Define a regular expression to validate the account ID format
    static let regex = try! NSRegularExpression(pattern: "^[2-9A-HJ-NP-Z]{13}$", options: [])

    // Custom initializer to validate the input string
    init?(string: String) {
        if AccountID.regex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count)) != nil {
            self.string = string
        } else {
            return nil // Invalid format
        }
    }
}