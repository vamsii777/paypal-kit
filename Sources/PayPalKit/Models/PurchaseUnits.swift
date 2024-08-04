import Foundation

/// An array of purchase units. Each purchase unit establishes a contract between a payer and the payee. Each purchase unit represents either a full or partial order that the payer intends to purchase from the payee.
struct PurchaseUnit: Codable, Hashable {
    /// The API caller-provided external ID for the purchase unit. Required for multiple purchase units when you must update the order through PATCH. If you omit this value and the order contains only one purchase unit, PayPal sets this value to default.
    let referenceID: String?
    /// The purchase description. The maximum length of the character is dependent on the type of characters used. The character length is specified assuming a US ASCII character. Depending on type of character; (e.g. accented character, Japanese characters) the number of characters that that can be specified as input might not equal the permissible max length.
    let description: String?
    /// The API caller-provided external ID. Used to reconcile client transactions with PayPal transactions. Appears in transaction and settlement reports but is not visible to the payer.
    let customID: String?
    /// The API caller-provided external invoice number for this order. Appears in both the payer's transaction history and the emails that the payer receives.
    let invoiceID: String?
    /// The soft descriptor is the dynamic text used to construct the statement descriptor that appears on a payer's card statement.
    ///
    /// If an Order is paid using the "PayPal Wallet", the statement descriptor will appear in following format on the payer's card statement: PAYPAL_prefix+(space)+merchant_descriptor+(space)+ soft_descriptor
    ///
    /// Note: The merchant descriptor is the descriptor of the merchant’s payment receiving preferences which can be seen by logging into the merchant account https://www.sandbox.paypal.com/businessprofile/settings/info/edit
    /// The PAYPAL prefix uses 8 characters. Only the first 22 characters will be displayed in the statement.
    /// For example, if:
    /// The PayPal prefix toggle is PAYPAL *.
    /// The merchant descriptor in the profile is Janes Gift.
    /// The soft descriptor is 800-123-1234.
    /// Then, the statement descriptor on the card is PAYPAL * Janes Gift 80.
    let softDescriptor: String?
    /// An array of items that the payer purchases from the payee. Each item corresponds to one or more products or services in an order.
    let items: [Item]?

    /// The amount of the purchase unit.
    let amount: Amount?

    /// The payee object. The merchant who receives payment for this transaction.
    let payee: Payee?

    /// The any additional payment instructions to be consider during payment processing. This processing instruction is applicable for Capturing an order or Authorizing an Order.
    let paymentInstruction: PaymentInstruction?

    /// The name and address of the person to whom to ship the items.
    let shipping: Shipping?

    enum CodingKeys: String, CodingKey {
        case referenceID = "reference_id"
        case description = "description"
        case customID = "custom_id"
        case invoiceID = "invoice_id"
        case softDescriptor = "soft_descriptor"
        case items = "items"
        case amount = "amount"
        case payee = "payee"
        case paymentInstruction = "payment_instruction"
        case shipping = "shipping"
    }
}