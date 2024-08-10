import Foundation
import Combine

class EmployeeService {
    static let shared = EmployeeService()
    private init() {}
    
    func fetchEmployees() -> AnyPublisher<[Employee], Error> {
        // In a real app, this would make an API call
        // For now, we'll return some mock data
        let mockEmployees = [
            Employee(id: "1", name: "Alice Williams", position: "Manager", email: "alice@example.com", phone: "123-456-7890"),
            Employee(id: "2", name: "Bob Smith", position: "Chef", email: "bob@example.com", phone: "987-654-3210"),
            Employee(id: "3", name: "Charlie Brown", position: "Waiter", email: "charlie@example.com", phone: "456-789-0123")
        ]
        
        return Just(mockEmployees)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func addEmployee(_ employee: Employee) -> AnyPublisher<Employee, Error> {
        // In a real app, this would make an API call to add the employee
        return Just(employee)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func updateEmployee(_ employee: Employee) -> AnyPublisher<Employee, Error> {
        // In a real app, this would make an API call to update the employee
        return Just(employee)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func deleteEmployee(id: String) -> AnyPublisher<String, Error> {
        // In a real app, this would make an API call to delete the employee
        return Just(id)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
