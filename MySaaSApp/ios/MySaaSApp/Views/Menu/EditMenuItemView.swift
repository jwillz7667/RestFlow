import SwiftUI

struct EditMenuItemView: View {
    @ObservedObject var viewModel: MenuViewModel
    @Environment(\.presentationMode) var presentationMode
    let item: MenuItem
    
    @State private var name: String
    @State private var description: String
    @State private var price: String
    @State private var selectedCategoryId: String

    init(viewModel: MenuViewModel, item: MenuItem) {
        self.viewModel = viewModel
        self.item = item
        _name = State(initialValue: item.name)
        _description = State(initialValue: item.description)
        _price = State(initialValue: String(format: "%.2f", item.price))
        _selectedCategoryId = State(initialValue: item.categoryId)
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                TextField("Price", text: $price)
                    .keyboardType(.decimalPad)
                Picker("Category", selection: $selectedCategoryId) {
                    ForEach(viewModel.categories) { category in
                        Text(category.name).tag(category.id)
                    }
                }
            }
            .navigationBarTitle("Edit Menu Item")
            .navigationBarItems(leading: cancelButton, trailing: saveButton)
        }
    }

    private var cancelButton: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }

    private var saveButton: some View {
        Button("Save") {
            guard let priceValue = Double(price) else { return }
            viewModel.updateMenuItem(id: item.id, name: name, description: description, price: priceValue, categoryId: selectedCategoryId)
            presentationMode.wrappedValue.dismiss()
        }
        .disabled(name.isEmpty || description.isEmpty || price.isEmpty || selectedCategoryId.isEmpty)
    }
}
