import Foundation
import Combine

class SettingsService {
    static let shared = SettingsService()
    private init() {}
    
    func fetchSettings() -> AnyPublisher<[Setting], Error> {
        // In a real app, this would make an API call
        // For now, we'll return some mock data
        let mockSettings = [
            Setting(id: "1", key: "taxRate", value: "0.08"),
            Setting(id: "2", key: "currency", value: "USD"),
            Setting(id: "3", key: "timeZone", value: "America/New_York")
        ]
        
        return Just(mockSettings)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func updateSetting(_ setting: Setting) -> AnyPublisher<Setting, Error> {
        // In a real app, this would make an API call to update the setting
        return Just(setting)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
