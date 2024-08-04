import Foundation

/// The tax information of the payer. Required only for Brazilian payer's. Both tax_id and tax_id_type are required.
struct TaxInfo: Codable, Hashable {
    /// The customer's tax ID value.
    let taxID: String
    /// The customer's tax ID type.
    let taxIDType: TaxIDType

    enum CodingKeys: String, CodingKey {
        case taxID = "tax_id"
        case taxIDType = "tax_id_type"
    }
}

/// The customer's tax ID type.
enum TaxIDType: String, Codable, CaseIterable {
    /// The individual tax ID type, typically is 11 characters long.
    case brCpf = "BR_CPF"
    /// The business tax ID type, typically is 14 characters long.
    case brCnpj = "BR_CNPJ"
}

