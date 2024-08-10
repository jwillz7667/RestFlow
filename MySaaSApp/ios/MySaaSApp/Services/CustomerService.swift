import Foundation
import Combine

class CustomerService {
    static let shared = CustomerService()
    private init() {}
    
    func fetchCustomers() -> AnyPublisher<[Customer], Error> {
        // In a real app, this would make an API call
        // For now, we'll return some mock data
        let mockCustomers = [
            Customer(id: "1", name: "John Doe", email: "john@example.com", phone: "123-456-7890"),
            Customer(id: "2", name: "Jane Smith", email: "jane@example.com", phone: "987-654-3210"),
            Customer(id: "3", name: "Bob Johnson", email: "bob@example.com", phone: "456-789-0123")
        ]
        
        return Just(mockCustomers)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func addCustomer(_ customer: Customer) -> AnyPublisher<Customer, Error> {
        // In a real app, this would make an API call to add the customer
        return Just(customer)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func updateCustomer(_ customer: Customer) -> AnyPublisher<Customer, Error> {
        // In a real app, this would make an API call to update the customer
        return Just(customer)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func deleteCustomer(id: String) -> AnyPublisher<String, Error> {
        // In a real app, this would make an API call to delete the customer
        return Just(id)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
