import Foundation
import Combine

class InventoryViewModel: ObservableObject {
    @Published var inventoryItems: [InventoryItem] = []
    @Published var lowStockItems: [InventoryItem] = []
    @Published var expiringItems: [InventoryItem] = []
    private var cancellables: Set<AnyCancellable> = []

    func fetchInventoryItems() {
        // In a real app, this would call an API service
        // For now, we'll use mock data
        let mockItems = [
            InventoryItem(id: "1", name: "Tomatoes", quantity: 50, price: 1.99, expirationDate: Date().addingTimeInterval(7*24*60*60)),
            InventoryItem(id: "2", name: "Lettuce", quantity: 30, price: 0.99, expirationDate: Date().addingTimeInterval(5*24*60*60)),
            InventoryItem(id: "3", name: "Beef", quantity: 20, price: 5.99, expirationDate: Date().addingTimeInterval(3*24*60*60))
        ]
        
        self.inventoryItems = mockItems
        updateLowStockItems()
        updateExpiringItems()
    }

    func updateLowStockItems() {
        lowStockItems = inventoryItems.filter { $0.quantity < 30 }
    }

    func updateExpiringItems() {
        let thresholdDate = Date().addingTimeInterval(3*24*60*60) // 3 days from now
        expiringItems = inventoryItems.filter { $0.expirationDate ?? Date.distantFuture < thresholdDate }
    }

    func addInventoryItem(_ item: InventoryItem) {
        inventoryItems.append(item)
        updateLowStockItems()
        updateExpiringItems()
    }

    func updateInventoryItem(_ item: InventoryItem) {
        if let index = inventoryItems.firstIndex(where: { $0.id == item.id }) {
            inventoryItems[index] = item
            updateLowStockItems()
            updateExpiringItems()
        }
    }

    func deleteInventoryItem(id: String) {
        inventoryItems.removeAll { $0.id == id }
        updateLowStockItems()
        updateExpiringItems()
    }
}

struct InventoryItem: Identifiable {
    let id: String
    let name: String
    var quantity: Int
    let price: Double
    let expirationDate: Date?

    var isExpiringSoon: Bool {
        guard let expirationDate = expirationDate else { return false }
        return expirationDate < Date().addingTimeInterval(3*24*60*60) // 3 days from now
    }
}
