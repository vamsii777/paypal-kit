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
}