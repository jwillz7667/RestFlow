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
}
