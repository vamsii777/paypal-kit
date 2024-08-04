import Foundation

/// The customer type associated with the Venmo payment token. This is to indicate whether the customer acting on the merchant / platform is either a business or a consumer.
enum CustomerType: String, Codable, CaseIterable {
    case consumer = "CONSUMER"
}
