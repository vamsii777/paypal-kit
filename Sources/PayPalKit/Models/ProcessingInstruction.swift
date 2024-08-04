import Foundation

enum ProcessingInstruction: String, Codable, CaseIterable {
    case orderCompleteOnPaymentApproval = "ORDER_COMPLETE_ON_PAYMENT_APPROVAL"
    case noInstruction = "NO_INSTRUCTION"
}