import SwiftUI

@main
struct CubacelConnectApp: App {
    @State private var store = USSDCodeStore()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(store)
        }
    }
}
