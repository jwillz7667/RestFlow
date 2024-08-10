import Foundation

struct User: Identifiable, Codable {
    let id: String
    var email: String
    var name: String
    var role: UserRole
}

enum UserRole: String, Codable {
    case admin
    case manager
    case staff
}

struct Order: Identifiable, Codable {
    let id: String
    let customerId: String
    var items: [OrderItem]
    var total: Double
    var status: OrderStatus
    let createdAt: Date
}

struct OrderItem: Identifiable, Codable {
    let id: String
    let menuItemId: String
    var quantity: Int
    var price: Double
}

enum OrderStatus: String, Codable {
    case pending
    case preparing
    case ready
    case delivered
    case cancelled
}

struct MenuItem: Identifiable, Codable {
    let id: String
    var name: String
    var description: String
    var price: Double
    var categoryId: String
}

struct Category: Identifiable, Codable {
    let id: String
    var name: String
}

struct Customer: Identifiable, Codable {
    let id: String
    var name: String
    var email: String
    var phone: String
}

struct Employee: Identifiable, Codable {
    let id: String
    var name: String
    var position: String
    var email: String
    var phone: String
}

struct InventoryItem: Identifiable, Codable {
    let id: String
    var name: String
    var quantity: Int
    var price: Double
    var expirationDate: Date?
}

struct Sale: Identifiable, Codable {
    let id: String
    let orderId: String
    let total: Double
    let date: Date
}

struct Expense: Identifiable, Codable {
    let id: String
    var description: String
    var amount: Double
    var date: Date
    var category: ExpenseCategory
}

enum ExpenseCategory: String, Codable {
    case inventory
    case salary
    case rent
    case utilities
    case marketing
    case other
}

struct Report: Identifiable, Codable {
    let id: String
    var name: String
    var type: ReportType
    var startDate: Date
    var endDate: Date
    var data: [String: Any]
}

enum ReportType: String, Codable {
    case sales
    case inventory
    case employees
    case expenses
}

struct Setting: Identifiable, Codable {
    let id: String
    var key: String
    var value: String
}
