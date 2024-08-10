import SwiftUI

struct OrderListView: View {
    @StateObject private var viewModel = OrderViewModel()
    @State private var searchText = ""
    @State private var showingFilterOptions = false

    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            
            List {
                ForEach(filteredOrders) { order in
                    NavigationLink(destination: OrderDetailView(order: order)) {
                        OrderRowView(order: order)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Orders")
        .navigationBarItems(trailing: filterButton)
        .sheet(isPresented: $showingFilterOptions) {
            FilterView(viewModel: viewModel)
        }
        .onAppear {
            viewModel.fetchOrders()
        }
    }
    
    private var filteredOrders: [Order] {
        viewModel.orders.filter { order in
            searchText.isEmpty || order.id.localizedCaseInsensitiveContains(searchText) ||
            order.customerName.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    private var filterButton: some View {
        Button(action: { showingFilterOptions = true }) {
            Image(systemName: "line.horizontal.3.decrease.circle")
                .accessibilityLabel("Filter orders")
        }
    }
}

struct OrderRowView: View {
    let order: Order

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Order #\(order.id)")
                    .font(.headline)
                Text(order.customerName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("$\(order.total, specifier: "%.2f")")
                    .font(.headline)
                Text(order.status.rawValue)
                    .font(.caption)
                    .padding(4)
                    .background(order.status.color)
                    .foregroundColor(.white)
                    .cornerRadius(4)
            }
        }
        .padding(.vertical, 8)
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search orders", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                }
            }
        }
        .padding(.horizontal)
    }
}

struct FilterView: View {
    @ObservedObject var viewModel: OrderViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Status")) {
                    ForEach(Order.Status.allCases, id: \.self) { status in
                        FilterToggle(isOn: binding(for: status), label: status.rawValue)
                    }
                }
                
                Section(header: Text("Date Range")) {
                    DatePicker("From", selection: $viewModel.filterStartDate, displayedComponents: .date)
                    DatePicker("To", selection: $viewModel.filterEndDate, displayedComponents: .date)
                }
            }
            .navigationTitle("Filter Orders")
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    private func binding(for status: Order.Status) -> Binding<Bool> {
        Binding(
            get: { viewModel.filterStatuses.contains(status) },
            set: { isOn in
                if isOn {
                    viewModel.filterStatuses.insert(status)
                } else {
                    viewModel.filterStatuses.remove(status)
                }
            }
        )
    }
}

struct FilterToggle: View {
    @Binding var isOn: Bool
    let label: String

    var body: some View {
        Toggle(isOn: $isOn) {
            Text(label)
        }
    }
}
