import Foundation

/// Loads and exposes the bundled USSD code catalog.
@Observable
final class USSDCodeStore {
    private(set) var categories: [USSDCategory] = []
    private(set) var codes: [USSDCode] = []
    private(set) var carrier: String = ""

    init(bundle: Bundle = .main) {
        load(from: bundle)
    }

    func codes(in category: USSDCategory) -> [USSDCode] {
        codes.filter { $0.category == category.id }
    }

    private func load(from bundle: Bundle) {
        guard let url = bundle.url(forResource: "ussd_codes", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let catalog = try? JSONDecoder().decode(USSDCatalog.self, from: data)
        else {
            assertionFailure("Failed to load ussd_codes.json from the app bundle")
            return
        }
        categories = catalog.categories
        codes = catalog.codes
        carrier = catalog.carrier
    }
}
