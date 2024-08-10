import Foundation
import Combine

class EmployeeViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    private var cancellables: Set<AnyCancellable> = []

    func fetchEmployees() {
        // In a real app, this would call an API service
        // For now, we'll use mock data
        let mockEmployees = [
            Employee(id: "1", name: "Alice Williams", position: "Manager", email: "alice@example.com", phone: "123-456-7890"),
            Employee(id: "2", name: "Bob Smith", position: "Chef", email: "bob@example.com", phone: "987-654-3210"),
            Employee(id: "3", name: "Charlie Brown", position: "Waiter", email: "charlie@example.com", phone: "456-789-0123")
        ]
        
        self.employees = mockEmployees
    }

    func addEmployee(_ employee: Employee) {
        employees.append(employee)
    }

    func updateEmployee(_ employee: Employee) {
        if let index = employees.firstIndex(where: { $0.id == employee.id }) {
            employees[index] = employee
        }
    }

    func deleteEmployee(id: String) {
        employees.removeAll { $0.id == id }
    }
}

struct Employee: Identifiable {
    let id: String
    var name: String
    var position: String
    var email: String
    var phone: String
}
