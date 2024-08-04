import Foundation

/// Response received after authorizing payment for an order. 
struct AuthorizeOrderResponse: Codable, Hashable {
    let createTime: String?
    let updateTime: String?
    let id: String?
    let processingInstruction: ProcessingInstruction?
    let purchaseUnits: [PurchaseUnit]?
    let links: [Link]?
    let paymentSource: PaymentSource?
    let intent: Intent?
    let payer: Payer?
    let status: OrderStatus?

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
