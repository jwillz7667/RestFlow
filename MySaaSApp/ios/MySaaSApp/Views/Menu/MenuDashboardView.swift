import SwiftUI

struct MenuDashboardView: View {
    @StateObject private var viewModel = MenuViewModel()

    var body: some View {
        List {
            ForEach(viewModel.categories) { category in
                Section(header: Text(category.name)) {
                    ForEach(viewModel.menuItems.filter { $0.categoryId == category.id }) { item in
                        MenuItemRowView(item: item)
                    }
                }
            }
        }
        .navigationBarTitle("Menu")
        .navigationBarItems(trailing: Button("Add Item") {
            // Action to add new menu item
        })
        .onAppear {
            viewModel.fetchMenuData()
        }
    }
}

struct MenuItemRowView: View {
    let item: MenuItem

    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            Text("$\(item.price, specifier: "%.2f")")
        }
    }
}
