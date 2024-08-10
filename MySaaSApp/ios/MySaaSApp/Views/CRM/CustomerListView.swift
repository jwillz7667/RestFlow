import SwiftUI

struct CustomerListView: View {
    @StateObject private var viewModel = CustomerViewModel()
    @State private var searchText = ""
    @State private var showingAddCustomerView = false

    var body: some View {
        List {
            SearchBar(text: $searchText, placeholder: "Search customers")
            
            ForEach(filteredCustomers) { customer in
                NavigationLink(destination: CustomerDetailView(customer: customer)) {
                    CustomerRowView(customer: customer)
                }
            }
            .onDelete(perform: deleteCustomers)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Customers")
        .navigationBarItems(trailing: addButton)
        .sheet(isPresented: $showingAddCustomerView) {
            AddCustomerView(viewModel: viewModel)
        }
        .onAppear {
            viewModel.fetchCustomers()
        }
    }
    
    private var filteredCustomers: [Customer] {
        if searchText.isEmpty {
            return viewModel.customers
        } else {
            return viewModel.customers.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    private var addButton: some View {
        Button(action: {
            showingAddCustomerView = true
        }) {
            Image(systemName: "plus")
        }
    }
    
    private func deleteCustomers(at offsets: IndexSet) {
        for index in offsets {
            let customer = filteredCustomers[index]
            viewModel.deleteCustomer(id: customer.id)
        }
    }
}

struct CustomerRowView: View {
    let customer: Customer
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(customer.name)
                .font(.headline)
            Text(customer.email)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct CustomerListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomerListView()
        }
    }
}
