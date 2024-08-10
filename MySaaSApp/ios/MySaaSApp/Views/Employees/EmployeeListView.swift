import SwiftUI

struct EmployeeListView: View {
    @StateObject private var viewModel = EmployeeViewModel()
    @State private var showingAddEmployeeSheet = false
    @State private var searchText = ""

    var body: some View {
        List {
            SearchBar(text: $searchText, placeholder: "Search employees")
            
            ForEach(filteredEmployees) { employee in
                NavigationLink(destination: EmployeeDetailView(employee: employee)) {
                    EmployeeRowView(employee: employee)
                }
            }
            .onDelete(perform: deleteEmployee)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Employees")
        .navigationBarItems(trailing: addButton)
        .sheet(isPresented: $showingAddEmployeeSheet) {
            AddEmployeeView(viewModel: viewModel)
        }
        .onAppear {
            viewModel.fetchEmployees()
        }
    }
    
    private var filteredEmployees: [Employee] {
        if searchText.isEmpty {
            return viewModel.employees
        } else {
            return viewModel.employees.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    private var addButton: some View {
        Button(action: {
            showingAddEmployeeSheet = true
        }) {
            Image(systemName: "plus")
        }
    }
    
    private func deleteEmployee(at offsets: IndexSet) {
        for index in offsets {
            let employee = filteredEmployees[index]
            viewModel.deleteEmployee(id: employee.id)
        }
    }
}

struct EmployeeRowView: View {
    let employee: Employee
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(employee.name)
                .font(.headline)
            Text(employee.position)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmployeeListView()
        }
    }
}
