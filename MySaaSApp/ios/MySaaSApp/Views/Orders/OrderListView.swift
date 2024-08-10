import SwiftUI

struct OrderListView: View {
    @StateObject private var viewModel = OrderViewModel()

    var body: some View {
        List(viewModel.orders) { order in
            NavigationLink(destination: OrderDetailView(order: order)) {
                OrderRowView(order: order)
            }
        }
        .navigationBarTitle("Orders")
        .onAppear {
            viewModel.fetchOrders()
        }
    }
}

struct OrderRowView: View {
    let order: Order

    var body: some View {
        VStack(alignment: .leading) {
            Text("Order #\(order.id)")
                .font(.headline)
            Text("Total: $\(order.total, specifier: "%.2f")")
                .font(.subheadline)
        }
    }
}
