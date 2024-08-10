import SwiftUI

struct MenuManagementView: View {
    @StateObject private var viewModel = MenuViewModel()
    @State private var showingAddItemView = false
    @State private var selectedItem: MenuItem?
    @State private var itemToDelete: MenuItem?
    @State private var showingDeleteConfirmation = false

    var body: some View {
        List {
            ForEach(viewModel.categories) { category in
                Section(header: Text(category.name)) {
                    ForEach(viewModel.menuItems.filter { $0.categoryId == category.id }) { item in
                        MenuItemRowView(item: item)
                            .onTapGesture {
                                selectedItem = item
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    itemToDelete = item
                                    showingDeleteConfirmation = true
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Menu Management")
        .navigationBarItems(trailing: addButton)
        .sheet(isPresented: $showingAddItemView) {
            AddMenuItemView(viewModel: viewModel)
        }
        .sheet(item: $selectedItem) { item in
            EditMenuItemView(viewModel: viewModel, item: item)
        }
        .confirmationDialog("Are you sure you want to delete this item?",
                            isPresented: $showingDeleteConfirmation,
                            titleVisibility: .visible) {
            Button("Delete", role: .destructive) {
                if let item = itemToDelete {
                    viewModel.deleteMenuItem(id: item.id)
                }
                itemToDelete = nil
            }
        }
        .onAppear {
            viewModel.fetchMenuData()
        }
    }

    private var addButton: some View {
        Button(action: {
            showingAddItemView = true
        }) {
            Image(systemName: "plus")
        }
    }
}

struct MenuItemRowView: View {
    let item: MenuItem

    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .font(.headline)
            Text(item.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("$\(item.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.blue)
        }
    }
}

struct MenuManagementView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuManagementView()
        }
    }
}
