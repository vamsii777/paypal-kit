import Foundation

// MARK: - Application Context

/// Customize the payer experience during the approval process for the payment with PayPal.
struct ApplicationContext: Codable, Hashable {
    /// DEPRECATED. The label that overrides the business name in the PayPal account on the PayPal site. The fields in `application_context` are now available in the `experience_context` object under the `payment_source` which supports them (eg. `payment_source.paypal.experience_context.brand_name`). Please specify this field in the `experience_context` object instead of the `application_context` object.
    let brandName: String?
    /// DEPRECATED. DEPRECATED. The type of landing page to show on the PayPal site for customer checkout. The fields in `application_context` are now available in the `experience_context` object under the `payment_source` which supports them (eg. `payment_source.paypal.experience_context.landing_page`). Please specify this field in the `experience_context` object instead of the `application_context` object.
    let landingPage: LandingPage?
    /// DEPRECATED. DEPRECATED. The shipping preference:
    ///
    /// - Displays the shipping address to the customer.
    /// - Enables the customer to choose an address on the PayPal site.
    /// - Restricts the customer from changing the address during the payment-approval process.
    /// . The fields in `application_context` are now available in the `experience_context` object under the `payment_source` which supports them (eg. `payment_source.paypal.experience_context.shipping_preference`). Please specify this field in the `experience_context` object instead of the `application_context` object.
    let shippingPreference: ShippingPreference?
    /// DEPRECATED. Configures a Continue or Pay Now checkout flow. The fields in `application_context` are now available in the `experience_context` object under the `payment_source` which supports them (eg. `payment_source.paypal.experience_context.user_action`). Please specify this field in the `experience_context` object instead of the `application_context` object.
    let userAction: UserAction?
    /// DEPRECATED. The URL where the customer is redirected after the customer approves the payment. The fields in `application_context` are now available in the `experience_context` object under the `payment_source` which supports them (eg. `payment_source.paypal.experience_context.return_url`). Please specify this field in the `experience_context` object instead of the `application_context` object.
    let returnURL: String?
    /// DEPRECATED. The URL where the customer is redirected after the customer cancels the payment. The fields in `application_context` are now available in the `experience_context` object under the `payment_source` which supports them (eg. `payment_source.paypal.experience_context.cancel_url`). Please specify this field in the `experience_context` object instead of the `application_context` object.
    let cancelURL: String?
    /// DEPRECATED. The BCP 47-formatted locale of pages that the PayPal payment experience shows. PayPal supports a five-character code. For example, da-DK, he-IL, id-ID, ja-JP, no-NO, pt-BR, ru-RU, sv-SE, th-TH, zh-CN, zh-HK, or zh-TW. The fields in `application_context` are now available in the `experience_context` object under the `payment_source` which supports them (eg. `payment_source.paypal.experience_context.locale`). Please specify this field in the `experience_context` object instead of the `application_context` object.
    let locale: String?
    /// DEPRECATED. The customer and merchant payment preferences. The fields in `application_context` are now available in the `experience_context` object under the `payment_source` which supports them (eg. `payment_source.paypal.experience_context.payment_method_selected`). Please specify this field in the `experience_context` object instead of the `application_context` object..
    let paymentMethod: PaymentMethod?
    /// DEPRECATED. Provides additional details to process a payment using a payment_source that has been stored or is intended to be stored (also referred to as stored_credential or card-on-file).
    /// Parameter compatibility:
    ///
    /// - `payment_type=ONE_TIME` is compatible only with `payment_initiator=CUSTOMER`.
    /// - `usage=FIRST` is compatible only with `payment_initiator=CUSTOMER`.
    /// - `previous_transaction_reference` or `previous_network_transaction_reference` is compatible only with `payment_initiator=MERCHANT`.
    /// - Only one of the parameters - `previous_transaction_reference` and `previous_network_transaction_reference` - can be present in the request.
    /// . The fields in `stored_payment_source` are now available in the `stored_credential` object under the `payment_source` which supports them (eg. `payment_source.card.stored_credential.payment_initiator`). Please specify this field in the `payment_source` object instead of the `application_context` object.
    let storedPaymentSource: StoredPaymentSource?

    enum CodingKeys: String, CodingKey {
        case brandName = "brand_name"
        case landingPage = "landing_page"
        case shippingPreference = "shipping_preference"
        case userAction = "user_action"
        case returnURL = "return_url"
        case cancelURL = "cancel_url"
        case locale = "locale"
        case paymentMethod = "payment_method"
        case storedPaymentSource = "stored_payment_source"
    }
}

/// DEPRECATED. DEPRECATED.
enum PaymentMethod: Codable, Hashable {
    /// NACHA (the regulatory body governing the ACH network) requires that API callers (merchants, partners) obtain the consumer’s explicit authorization before initiating a transaction. To stay compliant, you’ll need to make sure that you retain a compliant authorization for each transaction that you originate to the ACH Network using this API. ACH transactions are categorized (using SEC codes) by how you capture authorization from the Receiver (the person whose bank account is being debited or credited). PayPal supports the following SEC codes.
    let standardEntryClassCode: StandardEntryClassCode?
    /// The merchant-preferred payment methods.
    let payeePreferred: PayeePreferred?

    enum CodingKeys: String, CodingKey {
        case standardEntryClassCode = "standard_entry_class_code"
        case payeePreferred = "payee_preferred"
    }
}

/// The merchant-preferred payment methods.
enum PayeePreferred: String, Codable, CaseIterable {
    /// Accepts any type of payment from the customer.
    case unrestricted = "UNRESTRICTED"
    /// Accepts only immediate payment from the customer. For example, credit card, PayPal balance, or instant ACH. Ensures that at the time of capture, the payment does not have the pending status.
    case immediatePaymentRequired = "IMMEDIATE_PAYMENT_REQUIRED"
}

/// NACHA (the regulatory body governing the ACH network) requires that API callers (merchants, partners) obtain the consumer’s explicit authorization before initiating a transaction. To stay compliant, you’ll need to make sure that you retain a compliant authorization for each transaction that you originate to the ACH Network using this API. ACH transactions are categorized (using SEC codes) by how you capture authorization from the Receiver (the person whose bank account is being debited or credited). PayPal supports the following SEC codes.
enum StandardEntryClassCode: String, Codable, CaseIterable {
    /// The API caller (merchant/partner) accepts authorization and payment information from a consumer over the telephone.
    case tel = "TEL"
    /// The API caller (merchant/partner) accepts Debit transactions from a consumer on their website.
    case web = "WEB"
    /// Cash concentration and disbursement for corporate debit transaction. Used to disburse or consolidate funds. Entries are usually Optional high-dollar, low-volume, and time-critical. (e.g. intra-company transfers or invoice payments to suppliers).
    case ccd = "CCD"
    /// Prearranged payment and deposit entries. Used for debit payments authorized by a consumer account holder, and usually initiated by a company. These are usually recurring debits (such as insurance premiums).
    case ppd = "PPD"
}

/// DEPRECATED. Provides additional details to process a payment using a payment_source that has been stored or is intended to be stored (also referred to as stored_credential or card-on-file).
/// Parameter compatibility:
///
/// - `payment_type=ONE_TIME` is compatible only with `payment_initiator=CUSTOMER`.
/// - `usage=FIRST` is compatible only with `payment_initiator=CUSTOMER`.
/// - `previous_transaction_reference` or `previous_network_transaction_reference` is compatible only with `payment_initiator=MERCHANT`.
/// - Only one of the parameters - `previous_transaction_reference` and `previous_network_transaction_reference` - can be present in the request.
/// . The fields in `stored_payment_source` are now available in the `stored_credential` object under the `payment_source` which supports them (eg. `payment_source.card.stored_credential.payment_initiator`). Please specify this field in the `payment_source` object instead of the `application_context` object.
struct StoredPaymentSource: Codable, Hashable {
    /// The person or party who initiated or triggered the payment.
    let paymentInitiator: PaymentInitiator
    /// Indicates the type of the stored payment_source payment.
    let paymentType: PaymentType
    /// Indicates if this is a first or subsequent payment using a stored payment source (also referred to as stored credential or card on file).
    let usage: Usage?
    /// Reference values used by the card network to identify a transaction.
    let previousNetworkTransactionReference: PreviousNetworkTransactionReference?

    enum CodingKeys: String, CodingKey {
        case paymentInitiator = "payment_initiator"
        case paymentType = "payment_type"
        case usage = "usage"
        case previousNetworkTransactionReference = "previous_network_transaction_reference"
    }
}

/// Reference values used by the card network to identify a transaction.
struct PreviousNetworkTransactionReference: Codable, Hashable {
    /// Transaction reference id returned by the scheme. For Visa and Amex, this is the "Tran id" field in response. For MasterCard, this is the "BankNet reference id" field in response. For Discover, this is the "NRID" field in response. The pattern we expect for this field from Visa/Amex/CB/Discover is numeric, Mastercard/BNPP is alphanumeric and Paysecure is alphanumeric with special character -.
    let id: String
    /// The date that the transaction was authorized by the scheme. This field may not be returned for all networks. MasterCard refers to this field as "BankNet reference date.
    let date: String?
    /// Reference ID issued for the card transaction. This ID can be used to track the transaction across processors, card brands and issuing banks.
    let acquirerReferenceNumber: String?
    /// Name of the card network through which the transaction was routed.
    let network: AvailableNetwork?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case date = "date"
        case acquirerReferenceNumber = "acquirer_reference_number"
        case network = "network"
    }
}


/// The person or party who initiated or triggered the payment.
enum PaymentInitiator: String, Codable, CaseIterable {
    /// Payment is initiated with the active engagement of the customer. e.g. a customer checking out on a merchant website.
    case customer = "CUSTOMER"
    /// Payment is initiated by merchant on behalf of the customer without the active engagement of customer. e.g. a merchant charging the monthly payment of a subscription to the customer.
    case merchant = "MERCHANT"
}

/// Indicates the type of the stored payment_source payment.
enum PaymentType: String, Codable, CaseIterable {
    /// One Time payment such as online purchase or donation. (e.g. Checkout with one-click).
    case oneTime = "ONE_TIME"
    /// Payment which is part of a series of payments with fixed or variable amounts, following a fixed time interval. (e.g. Subscription payments).
    case recurring = "RECURRING"
    /// Payment which is part of a series of payments that occur on a non-fixed schedule and/or have variable amounts. (e.g. Account Topup payments).
    case unscheduled = "UNSCHEDULED"
}

/// Indicates if this is a first or subsequent payment using a stored payment source (also referred to as stored credential or card on file).
enum Usage: String, Codable, CaseIterable {
    /// Indicates the Initial/First payment with a payment_source that is intended to be stored upon successful processing of the payment.
    case first = "FIRST"
    /// Indicates a payment using a stored payment_source which has been successfully used previously for a payment.
    case subsequent = "SUBSEQUENT"
    /// Indicates that PayPal will derive the value of FIRST or SUBSEQUENT based on data available to PayPal.
    case derived = "DERIVED"
}

/// DEPRECATED. Configures a Continue or Pay Now checkout flow. The fields in `application_context` are now available in the `experience_context` object under the `payment_source` which supports them (eg. `payment_source.paypal.experience_context.user_action`). Please specify this field in the `experience_context` object instead of the `application_context` object.
enum UserAction: String, Codable, CaseIterable {
    /// After you redirect the customer to the PayPal payment page, a Continue button appears. Use this option when the final amount is not known when the checkout flow is initiated and you want to redirect the customer to the merchant page without processing the payment.
    case `continue` = "CONTINUE"
    /// After you redirect the customer to the PayPal payment page, a Pay Now button appears. Use this option when the final amount is known when the checkout is initiated and you want to process the payment immediately when the customer clicks Pay Now.
    case payNow = "PAY_NOW"
}