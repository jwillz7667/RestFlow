import SwiftUI

struct AddMenuItemView: View {
    @ObservedObject var viewModel: MenuViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var description = ""
    @State private var price = ""
    @State private var selectedCategoryId = ""

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
            .navigationBarTitle("Add Menu Item")
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
            viewModel.addMenuItem(name: name, description: description, price: priceValue, categoryId: selectedCategoryId)
            presentationMode.wrappedValue.dismiss()
        }
        .disabled(name.isEmpty || description.isEmpty || price.isEmpty || selectedCategoryId.isEmpty)
    }
}
