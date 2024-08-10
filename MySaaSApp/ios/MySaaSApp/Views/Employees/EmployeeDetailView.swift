import SwiftUI

struct EmployeeDetailView: View {
    @ObservedObject var viewModel: EmployeeViewModel
    let employee: Employee
    @State private var isEditing = false
    @State private var editedEmployee: Employee
    
    init(employee: Employee) {
        self.employee = employee
        self.viewModel = EmployeeViewModel()
        _editedEmployee = State(initialValue: employee)
    }
    
    var body: some View {
        Form {
            Section(header: Text("Employee Information")) {
                if isEditing {
                    TextField("Name", text: $editedEmployee.name)
                    TextField("Position", text: $editedEmployee.position)
                    TextField("Email", text: $editedEmployee.email)
                    TextField("Phone", text: $editedEmployee.phone)
                } else {
                    Text(employee.name)
                    Text(employee.position)
                    Text(employee.email)
                    Text(employee.phone)
                }
            }
            
            Section(header: Text("Work Schedule")) {
                // Add work schedule information here
                Text("Work schedule placeholder")
            }
            
            Section(header: Text("Performance")) {
                // Add performance metrics here
                Text("Performance metrics placeholder")
            }
        }
        .navigationTitle(employee.name)
        .navigationBarItems(trailing: editButton)
    }
    
    private var editButton: some View {
        Button(action: {
            if isEditing {
                viewModel.updateEmployee(editedEmployee)
            }
            isEditing.toggle()
        }) {
            Text(isEditing ? "Save" : "Edit")
        }
    }
}

struct EmployeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmployeeDetailView(employee: Employee(id: "1", name: "John Doe", position: "Manager", email: "john@example.com", phone: "123-456-7890"))
        }
    }
}
