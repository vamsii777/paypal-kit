import Foundation

// MARK: - DecryptedToken
/// The decrypted payload details for the apple pay token.
struct AppleDecryptedToken: Codable, Hashable {
    /// Apple Pay Hex-encoded device manufacturer identifier. The pattern is defined by an external party and supports Unicode.
    let deviceManufacturerID: String?
    /// Indicates the type of payment data passed, in case of Non China the payment data is 3DSECURE and for China it is EMV.
    let paymentDataType: PaymentDataType?
    /// The transaction amount for the payment that the payer has approved on apple platform.
    let transactionAmount: Money?
    /// Apple Pay tokenized credit card used to pay.
    let tokenizedCard: TokenizedCard

    enum CodingKeys: String, CodingKey {
        case deviceManufacturerID = "device_manufacturer_id"
        case paymentDataType = "payment_data_type"
        case transactionAmount = "transaction_amount"
        case tokenizedCard = "tokenized_card"
    }
}
