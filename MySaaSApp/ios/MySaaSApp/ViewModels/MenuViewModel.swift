import Foundation
import Combine

class MenuViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var menuItems: [MenuItem] = []
    private var cancellables: Set<AnyCancellable> = []

    func fetchMenuData() {
        MenuService.shared.fetchMenuData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching menu data: \(error)")
                }
            }, receiveValue: { [weak self] (categories, menuItems) in
                self?.categories = categories
                self?.menuItems = menuItems
            })
            .store(in: &cancellables)
    }
    
    func addMenuItem(name: String, description: String, price: Double, categoryId: String) {
        MenuService.shared.addMenuItem(name: name, description: description, price: price, categoryId: categoryId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error adding menu item: \(error)")
                }
            }, receiveValue: { [weak self] newItem in
                self?.menuItems.append(newItem)
            })
            .store(in: &cancellables)
    }
    
    func updateMenuItem(id: String, name: String, description: String, price: Double, categoryId: String) {
        MenuService.shared.updateMenuItem(id: id, name: name, description: description, price: price, categoryId: categoryId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error updating menu item: \(error)")
                }
            }, receiveValue: { [weak self] updatedItem in
                if let index = self?.menuItems.firstIndex(where: { $0.id == updatedItem.id }) {
                    self?.menuItems[index] = updatedItem
                }
            })
            .store(in: &cancellables)
    }
}
