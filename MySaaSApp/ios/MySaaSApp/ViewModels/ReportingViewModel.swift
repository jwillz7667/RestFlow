import Foundation
import Combine

class ReportingViewModel: ObservableObject {
    @Published var salesData: [SalesDataPoint] = []
    @Published var inventoryData: [InventoryDataPoint] = []
    @Published var employeeData: [EmployeeDataPoint] = []
    private var cancellables: Set<AnyCancellable> = []

    func fetchReportData() {
        // In a real app, this would call an API service
        // For now, we'll use mock data
        self.salesData = [
            SalesDataPoint(date: "2023-05-01", amount: 1000.0),
            SalesDataPoint(date: "2023-05-02", amount: 1200.0),
            SalesDataPoint(date: "2023-05-03", amount: 950.0)
        ]
        
        self.inventoryData = [
            InventoryDataPoint(itemName: "Tomatoes", quantity: 50),
            InventoryDataPoint(itemName: "Lettuce", quantity: 30),
            InventoryDataPoint(itemName: "Beef", quantity: 20)
        ]
        
        self.employeeData = [
            EmployeeDataPoint(name: "Alice Williams", hoursWorked: 40),
            EmployeeDataPoint(name: "Bob Smith", hoursWorked: 35),
            EmployeeDataPoint(name: "Charlie Brown", hoursWorked: 30)
        ]
    }
}

struct SalesDataPoint: Identifiable {
    let id = UUID()
    let date: String
    let amount: Double
}

struct InventoryDataPoint: Identifiable {
    let id = UUID()
    let itemName: String
    let quantity: Int
}

struct EmployeeDataPoint: Identifiable {
    let id = UUID()
    let name: String
    let hoursWorked: Int
}
