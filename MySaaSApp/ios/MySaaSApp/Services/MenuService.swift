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
            Category(id: "2", name: "Main Courses")
        ]
        
        let mockMenuItems = [
            MenuItem(id: "1", name: "Salad", description: "Fresh garden salad", price: 8.99, categoryId: "1"),
            MenuItem(id: "2", name: "Steak", description: "Grilled sirloin steak", price: 24.99, categoryId: "2")
        ]
        
        return Just((mockCategories, mockMenuItems))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
