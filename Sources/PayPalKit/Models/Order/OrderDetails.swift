import Foundation

struct OrderDetails: Codable, Hashable {
    let id: String?
    let createTime: String?
    let updateTime: String?
    let processingInstruction: ProcessingInstruction?
    let purchaseUnits: [PurchaseUnit]?
    let links: [Link]?
    let paymentSource: PaymentSource?
    let payer: Payer?
    let intent: Intent?
    let status: Status?
    let taxTotal: Money?

    enum CodingKeys: String, CodingKey {
        case createTime = "create_time"
        case updateTime = "update_time"
        case id = "id"
        case processingInstruction = "processing_instruction"
        case purchaseUnits = "purchase_units"
        case links = "links"
        case paymentSource = "payment_source"
        case intent = "intent"
        case payer = "payer"
        case status = "status"
    }
}