import UIKit

/// Opens the system dialer with a USSD sequence or phone number.
enum DialService {
    /// Builds a `tel://` URL for the given code.
    /// `#` must be percent-encoded or the URL is rejected by iOS.
    static func dialURL(for rawCode: String) -> URL? {
        let encoded = rawCode
            .replacingOccurrences(of: "#", with: "%23")
            .replacingOccurrences(of: " ", with: "")
        return URL(string: "tel://\(encoded)")
    }

    /// Hands the code to the system dialer. Returns false when the device
    /// cannot place calls (e.g. iPad, simulator).
    @discardableResult
    static func dial(_ rawCode: String) -> Bool {
        guard let url = dialURL(for: rawCode), UIApplication.shared.canOpenURL(url) else {
            return false
        }
        UIApplication.shared.open(url)
        return true
    }
}
