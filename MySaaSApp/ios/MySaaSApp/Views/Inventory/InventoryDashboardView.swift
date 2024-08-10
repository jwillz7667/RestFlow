import SwiftUI

struct InventoryDashboardView: View {
    @StateObject private var viewModel = InventoryViewModel()
    @State private var searchText = ""
    @State private var showingAddItemView = false

    var body: some View {
        VStack {
            SearchBar(text: $searchText, placeholder: "Search inventory items")
            
            List {
                ForEach(filteredItems) { item in
                    InventoryItemRow(item: item)
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Inventory")
        .navigationBarItems(trailing: addButton)
        .sheet(isPresented: $showingAddItemView) {
            AddInventoryItemView(viewModel: viewModel)
        }
        .onAppear {
            viewModel.fetchInventoryItems()
        }
    }
    
    private var filteredItems: [InventoryItem] {
        if searchText.isEmpty {
            return viewModel.inventoryItems
        } else {
            return viewModel.inventoryItems.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    private var addButton: some View {
        Button(action: {
            showingAddItemView = true
        }) {
            Image(systemName: "plus")
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let item = filteredItems[index]
            viewModel.deleteInventoryItem(id: item.id)
        }
    }
}

struct InventoryItemRow: View {
    let item: InventoryItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("Quantity: \(item.quantity)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text("$\(item.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.blue)
        }
    }
}

struct InventoryDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InventoryDashboardView()
        }
    }
}
