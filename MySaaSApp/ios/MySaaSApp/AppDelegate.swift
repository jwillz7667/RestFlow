import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Setup any global configurations or third-party services
        setupGlobalConfigurations()
        setupThirdPartyServices()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Handle any cleanup when discarding scenes
    }

    // MARK: - Private Methods

    private func setupGlobalConfigurations() {
        // Set up any global configurations for the app
        // For example, setting up a global appearance
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        UINavigationBar.appearance().tintColor = .systemBlue
    }

    private func setupThirdPartyServices() {
        // Initialize any third-party services
        // For example, analytics, crash reporting, etc.
        // AnalyticsManager.shared.configure()
        // CrashReporter.shared.start()
    }
}
