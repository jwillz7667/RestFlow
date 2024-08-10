import Foundation
import Combine

class CRMViewModel: ObservableObject {
    @Published var customers: [Customer] = []
    private var cancellables: Set<AnyCancellable> = []

    func fetchCustomers() {
        // In a real app, this would call an API service
        // For now, we'll use mock data
        let mockCustomers = [
            Customer(id: "1", name: "John Doe", email: "john@example.com", phone: "123-456-7890"),
            Customer(id: "2", name: "Jane Smith", email: "jane@example.com", phone: "987-654-3210"),
            Customer(id: "3", name: "Bob Johnson", email: "bob@example.com", phone: "456-789-0123")
        ]
        
        self.customers = mockCustomers
    }

    func addCustomer(_ customer: Customer) {
        customers.append(customer)
    }

    func updateCustomer(_ customer: Customer) {
        if let index = customers.firstIndex(where: { $0.id == customer.id }) {
            customers[index] = customer
        }
    }

    func deleteCustomer(id: String) {
        customers.removeAll { $0.id == id }
    }
}

struct Customer: Identifiable {
    let id: String
    var name: String
    var email: String
    var phone: String
}
