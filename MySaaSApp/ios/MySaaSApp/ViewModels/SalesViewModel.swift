import Foundation
import Combine

class SalesViewModel: ObservableObject {
    @Published var totalSales: Double = 0
    @Published var averageOrderValue: Double = 0
    @Published var numberOfOrders: Int = 0
    @Published var topSellingItems: [TopSellingItem] = []
    @Published var totalExpenses: Double = 0

    private var cancellables: Set<AnyCancellable> = []

    func fetchSalesData(for timeRange: TimeRange) {
        // In a real app, this would make an API call to fetch the data
        // For now, we'll use mock data
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.totalSales = Double.random(in: 1000...5000)
            self?.averageOrderValue = Double.random(in: 20...100)
            self?.numberOfOrders = Int.random(in: 50...200)
            self?.topSellingItems = [
                TopSellingItem(name: "Item 1", quantity: Int.random(in: 10...50)),
                TopSellingItem(name: "Item 2", quantity: Int.random(in: 10...50)),
                TopSellingItem(name: "Item 3", quantity: Int.random(in: 10...50))
            ]
            self?.totalExpenses = Double.random(in: 500...2000)
        }
    }
}
