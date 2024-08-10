import Foundation

struct Order: Identifiable, Codable {
    let id: String
    let customerId: String
    let items: [OrderItem]
    let total: Double
    let status: OrderStatus
    let createdAt: Date
    
    enum OrderStatus: String, Codable {
        case pending, preparing, ready, delivered, cancelled
    }
}

struct OrderItem: Identifiable, Codable {
    let id: String
    let menuItemId: String
    let quantity: Int
    let price: Double
}
