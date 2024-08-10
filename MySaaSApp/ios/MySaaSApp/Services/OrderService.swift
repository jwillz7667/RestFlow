import Foundation
import Combine

class OrderService {
    static let shared = OrderService()
    private init() {}
    
    func fetchOrders() -> AnyPublisher<[Order], Error> {
        // In a real app, this would make an API call
        // For now, we'll return some mock data
        let mockOrders = [
            Order(id: "1", customerId: "C1", items: [], total: 25.99, status: .pending, createdAt: Date()),
            Order(id: "2", customerId: "C2", items: [], total: 34.50, status: .preparing, createdAt: Date())
        ]
        
        return Just(mockOrders)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
