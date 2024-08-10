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
    
    func createOrder(_ order: Order) -> AnyPublisher<Order, Error> {
        // In a real app, this would make an API call to create a new order
        return Future<Order, Error> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                promise(.success(order))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func updateOrderStatus(orderId: String, status: Order.OrderStatus) -> AnyPublisher<Order, Error> {
        // In a real app, this would make an API call to update the order status
        return Future<Order, Error> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                let updatedOrder = Order(id: orderId, customerId: "C1", items: [], total: 25.99, status: status, createdAt: Date())
                promise(.success(updatedOrder))
            }
        }
        .eraseToAnyPublisher()
    }
}
