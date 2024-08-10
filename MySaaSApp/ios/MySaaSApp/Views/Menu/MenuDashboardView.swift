import SwiftUI

struct MenuDashboardView: View {
    @StateObject private var viewModel = MenuViewModel()
    @State private var searchText = ""
    @State private var showingAddItemView = false
    @State private var selectedItem: MenuItem?
    @State private var selectedCategoryId: String?

    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    CategoryFilterButton(title: "All", isSelected: selectedCategoryId == nil) {
                        selectedCategoryId = nil
                    }
                    ForEach(viewModel.categories) { category in
                        CategoryFilterButton(title: category.name, isSelected: selectedCategoryId == category.id) {
                            selectedCategoryId = category.id
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            List {
                ForEach(filteredCategories) { category in
                    Section(header: Text(category.name)) {
                        ForEach(filteredMenuItems(for: category)) { item in
                            MenuItemRowView(item: item)
                                .onTapGesture {
                                    selectedItem = item
                                }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
        .navigationBarTitle("Menu")
        .navigationBarItems(trailing: addButton)
        .sheet(isPresented: $showingAddItemView) {
            AddMenuItemView(viewModel: viewModel)
        }
        .sheet(item: $selectedItem) { item in
            EditMenuItemView(viewModel: viewModel, item: item)
        }
        .onAppear {
            viewModel.fetchMenuData()
        }
    }
    
    private var addButton: some View {
        Button(action: { showingAddItemView = true }) {
            Image(systemName: "plus")
                .accessibilityLabel("Add new menu item")
        }
    }
    
    private var filteredCategories: [Category] {
        guard let selectedCategoryId = selectedCategoryId else {
            return viewModel.categories
        }
        return viewModel.categories.filter { $0.id == selectedCategoryId }
    }
    
    private func filteredMenuItems(for category: Category) -> [MenuItem] {
        viewModel.menuItems.filter { item in
            item.categoryId == category.id &&
            (searchText.isEmpty || item.name.localizedCaseInsensitiveContains(searchText))
        }
    }
}

struct MenuItemRowView: View {
    let item: MenuItem

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            Spacer()
            Text("$\(item.price, specifier: "%.2f")")
                .font(.headline)
        }
        .padding(.vertical, 8)
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search menu items", text: $text)
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

struct CategoryFilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(20)
        }
    }
}
