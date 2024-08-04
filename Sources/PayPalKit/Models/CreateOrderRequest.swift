import Foundation

@available(*, deprecated, message: "The payer property is deprecated.")
struct CreateOrderRequest: Codable, Hashable {
    let purchaseUnits: [PurchaseUnit]
    let intent: Intent
    let payer: Payer?
    let paymentSource: PaymentSource?
    let applicationContext: ApplicationContext?
    
    enum CodingKeys: String, CodingKey {
        case purchaseUnits = "purchase_units"
        case intent = "intent"
        case payer = "payer"
        case paymentSource = "payment_source"
        case applicationContext = "application_context"
    }
}

struct CreateOrderRequest: Codable, Hashable {
    let purchaseUnits: [PurchaseUnit]
    let intent: Intent
    let paymentSource: PaymentSource?
    let applicationContext: ApplicationContext?
    
    enum CodingKeys: String, CodingKey {
        case purchaseUnits = "purchase_units"
        case intent = "intent"
        case paymentSource = "payment_source"
        case applicationContext = "application_context"
    }
}