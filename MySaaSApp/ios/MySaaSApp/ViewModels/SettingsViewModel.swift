import Foundation
import Combine

class SettingsViewModel: ObservableObject {
    @Published var taxRate: Double = 0.0
    @Published var currency: String = "USD"
    @Published var timeZone: TimeZone = TimeZone.current
    private var cancellables: Set<AnyCancellable> = []

    func fetchSettings() {
        // In a real app, this would call an API service
        // For now, we'll use mock data
        self.taxRate = 0.08
        self.currency = "USD"
        self.timeZone = TimeZone(identifier: "America/New_York") ?? TimeZone.current
    }

    func updateSettings(taxRate: Double, currency: String, timeZone: TimeZone) {
        // In a real app, this would call an API service to update the settings
        self.taxRate = taxRate
        self.currency = currency
        self.timeZone = timeZone
    }
}
