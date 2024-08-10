import SwiftUI

struct CustomerDetailView: View {
    let customer: Customer
    @StateObject private var viewModel = CustomerViewModel()
    @State private var isEditing = false
    @State private var editedCustomer: Customer
    
    init(customer: Customer) {
        self.customer = customer
        _editedCustomer = State(initialValue: customer)
    }
    
    var body: some View {
        Form {
            Section(header: Text("Customer Information")) {
                if isEditing {
                    TextField("Name", text: $editedCustomer.name)
                    TextField("Email", text: $editedCustomer.email)
                    TextField("Phone", text: $editedCustomer.phone)
                } else {
                    Text(customer.name)
                    Text(customer.email)
                    Text(customer.phone)
                }
            }
            
            Section(header: Text("Order History")) {
                ForEach(viewModel.customerOrders) { order in
                    NavigationLink(destination: OrderDetailView(order: order)) {
                        OrderRowView(order: order)
                    }
                }
            }
        }
        .navigationTitle(customer.name)
        .navigationBarItems(trailing: editButton)
        .onAppear {
            viewModel.fetchCustomerOrders(customerId: customer.id)
        }
    }
    
    private var editButton: some View {
        Button(action: {
            if isEditing {
                viewModel.updateCustomer(editedCustomer)
            }
            isEditing.toggle()
        }) {
            Text(isEditing ? "Save" : "Edit")
        }
    }
}

struct OrderRowView: View {
    let order: Order
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Order #\(order.id)")
                .font(.headline)
            Text("Total: $\(order.total, specifier: "%.2f")")
                .font(.subheadline)
            Text("Date: \(order.createdAt, formatter: itemFormatter)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

struct CustomerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomerDetailView(customer: Customer(id: "1", name: "John Doe", email: "john@example.com", phone: "123-456-7890"))
        }
    }
}
