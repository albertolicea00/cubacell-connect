import SwiftUI

/// Brand palette: deep navy, cyan, black and white.
extension Color {
    /// rgb(0, 0, 102) — primary brand color.
    static let brandNavy = Color(red: 0 / 255, green: 0 / 255, blue: 102 / 255)
    /// #09C — accent color.
    static let brandCyan = Color(red: 0 / 255, green: 153 / 255, blue: 204 / 255)
    /// Adaptive background: white in light mode, black in dark mode.
    static let appBackground = Color(UIColor.systemBackground)
    /// Adaptive foreground: black in light mode, white in dark mode.
    static let appForeground = Color(UIColor.label)
}

enum AppTheme {
    /// Monospaced style used to display dialable codes.
    static func codeFont(size: CGFloat = 17) -> Font {
        .system(size: size, weight: .semibold, design: .monospaced)
    }
}
