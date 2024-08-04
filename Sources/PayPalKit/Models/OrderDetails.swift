import Foundation

struct OrderDetails: Codable, Hashable {
    let id: String 
    let createTime: String?
    let updateTime: String?
    let processingInstruction: ProcessingInstruction?
    let links: [Link]?
    let intent: Intent?
    let status: Status?
    let taxTotal: Money?
    let payer: Payer?
}