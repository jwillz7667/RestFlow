import Foundation
import Combine

class OrderViewModel: ObservableObject {
    @Published var orders: [Order] = []
    private var cancellables: Set<AnyCancellable> = []

    func fetchOrders() {
        OrderService.shared.fetchOrders()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching orders: \(error)")
                }
            }, receiveValue: { [weak self] orders in
                self?.orders = orders
            })
            .store(in: &cancellables)
    }
}
