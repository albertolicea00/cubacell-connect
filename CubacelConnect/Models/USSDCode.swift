import Foundation

/// How a code is executed on the device.
enum USSDActionType: String, Codable {
    /// Dialed as a USSD sequence (e.g. *222#).
    case ussd
    /// A regular phone call (e.g. *2266).
    case call
}

/// A single ETECSA (Cubacel) service code.
struct USSDCode: Identifiable, Codable, Hashable {
    let id: String
    /// Raw code. May contain the `{input}` placeholder when user input is required.
    let code: String
    let title: String
    let details: String
    let category: String
    let type: USSDActionType
    let requiresInput: Bool
    let inputPlaceholder: String?
    let mnemonic: String?

    /// Code with the user-provided input substituted in.
    func resolvedCode(input: String = "") -> String {
        code.replacingOccurrences(of: "{input}", with: input)
    }
}

/// A group of related service codes.
struct USSDCategory: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    /// SF Symbol name used in the UI.
    let icon: String
}

/// Root shape of the bundled `ussd_codes.json` catalog.
struct USSDCatalog: Codable {
    let version: Int
    let carrier: String
    let categories: [USSDCategory]
    let codes: [USSDCode]
}
