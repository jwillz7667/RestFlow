import Foundation
import Combine

class InventoryService {
    static let shared = InventoryService()
    private init() {}
    
    func fetchInventoryItems() -> AnyPublisher<[InventoryItem], Error> {
        // In a real app, this would make an API call
        // For now, we'll return some mock data
        let mockItems = [
            InventoryItem(id: "1", name: "Tomatoes", quantity: 50, price: 1.99, expirationDate: Date().addingTimeInterval(7*24*60*60)),
            InventoryItem(id: "2", name: "Lettuce", quantity: 30, price: 0.99, expirationDate: Date().addingTimeInterval(5*24*60*60)),
            InventoryItem(id: "3", name: "Beef", quantity: 20, price: 5.99, expirationDate: Date().addingTimeInterval(3*24*60*60))
        ]
        
        return Just(mockItems)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func addInventoryItem(_ item: InventoryItem) -> AnyPublisher<InventoryItem, Error> {
        // In a real app, this would make an API call to add the item
        return Just(item)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func updateInventoryItem(_ item: InventoryItem) -> AnyPublisher<InventoryItem, Error> {
        // In a real app, this would make an API call to update the item
        return Just(item)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func deleteInventoryItem(id: String) -> AnyPublisher<String, Error> {
        // In a real app, this would make an API call to delete the item
        return Just(id)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
