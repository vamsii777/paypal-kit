import Foundation

struct ActivityTimestamps: Codable, Hashable {
    let createTime: String
    let updateTime: String

    enum CodingKeys: String, CodingKey {
        case createTime = "create_time"
        case updateTime = "update_time"
    }
}