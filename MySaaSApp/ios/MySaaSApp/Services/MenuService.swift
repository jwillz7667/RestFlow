import Foundation
import Combine

class MenuService {
    static let shared = MenuService()
    private init() {}
    
    func fetchMenuData() -> AnyPublisher<([Category], [MenuItem]), Error> {
        // In a real app, this would make an API call
        // For now, we'll return some mock data
        let mockCategories = [
            Category(id: "1", name: "Appetizers"),
            Category(id: "2", name: "Main Courses"),
            Category(id: "3", name: "Desserts")
        ]
        
        let mockMenuItems = [
            MenuItem(id: "1", name: "Salad", description: "Fresh garden salad", price: 8.99, categoryId: "1"),
            MenuItem(id: "2", name: "Steak", description: "Grilled sirloin steak", price: 24.99, categoryId: "2"),
            MenuItem(id: "3", name: "Chocolate Cake", description: "Rich chocolate cake", price: 6.99, categoryId: "3")
        ]
        
        return Just((mockCategories, mockMenuItems))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func addMenuItem(name: String, description: String, price: Double, categoryId: String) -> AnyPublisher<MenuItem, Error> {
        // In a real app, this would make an API call to add the item
        // For now, we'll just create a new item with a mock ID
        let newItem = MenuItem(id: UUID().uuidString, name: name, description: description, price: price, categoryId: categoryId)
        return Just(newItem)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func updateMenuItem(id: String, name: String, description: String, price: Double, categoryId: String) -> AnyPublisher<MenuItem, Error> {
        // In a real app, this would make an API call to update the item
        // For now, we'll just return the updated item
        let updatedItem = MenuItem(id: id, name: name, description: description, price: price, categoryId: categoryId)
        return Just(updatedItem)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func deleteMenuItem(id: String) -> AnyPublisher<String, Error> {
        // In a real app, this would make an API call to delete the item
        // For now, we'll just return the id of the deleted item
        return Just(id)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
