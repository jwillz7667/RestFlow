import SwiftUI

struct SalesDashboardView: View {
    @StateObject private var viewModel = SalesViewModel()
    @State private var selectedTimeRange: TimeRange = .today

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TimeRangePicker(selectedTimeRange: $selectedTimeRange)
                
                SalesSummaryCard(totalSales: viewModel.totalSales,
                                 averageOrderValue: viewModel.averageOrderValue,
                                 numberOfOrders: viewModel.numberOfOrders)
                
                TopSellingItemsCard(items: viewModel.topSellingItems)
                
                ExpenseSummaryCard(totalExpenses: viewModel.totalExpenses)
                
                Button("Add Expense") {
                    // TODO: Implement add expense functionality
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .navigationTitle("Sales Dashboard")
        .onAppear {
            viewModel.fetchSalesData(for: selectedTimeRange)
        }
        .onChange(of: selectedTimeRange) { newValue in
            viewModel.fetchSalesData(for: newValue)
        }
    }
}

struct TimeRangePicker: View {
    @Binding var selectedTimeRange: TimeRange

    var body: some View {
        Picker("Time Range", selection: $selectedTimeRange) {
            ForEach(TimeRange.allCases) { range in
                Text(range.rawValue).tag(range)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct SalesSummaryCard: View {
    let totalSales: Double
    let averageOrderValue: Double
    let numberOfOrders: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Sales Summary")
                .font(.headline)
            HStack {
                StatView(title: "Total Sales", value: "$\(totalSales, specifier: "%.2f")")
                Spacer()
                StatView(title: "Avg Order", value: "$\(averageOrderValue, specifier: "%.2f")")
                Spacer()
                StatView(title: "Orders", value: "\(numberOfOrders)")
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct TopSellingItemsCard: View {
    let items: [TopSellingItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Top Selling Items")
                .font(.headline)
            ForEach(items) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text("\(item.quantity)")
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ExpenseSummaryCard: View {
    let totalExpenses: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Expense Summary")
                .font(.headline)
            StatView(title: "Total Expenses", value: "$\(totalExpenses, specifier: "%.2f")")
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct StatView: View {
    let title: String
    let value: String

    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
        }
    }
}

enum TimeRange: String, CaseIterable, Identifiable {
    case today = "Today"
    case thisWeek = "This Week"
    case thisMonth = "This Month"
    case thisYear = "This Year"

    var id: String { self.rawValue }
}

struct TopSellingItem: Identifiable {
    let id = UUID()
    let name: String
    let quantity: Int
}

struct SalesDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SalesDashboardView()
        }
    }
}
