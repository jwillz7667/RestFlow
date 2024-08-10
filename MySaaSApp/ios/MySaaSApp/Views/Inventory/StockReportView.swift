import SwiftUI

struct StockReportView: View {
    @ObservedObject var viewModel: InventoryViewModel
    @State private var selectedReportType: ReportType = .lowStock
    
    enum ReportType: String, CaseIterable {
        case lowStock = "Low Stock"
        case expirationDate = "Expiration Date"
        case valueReport = "Value Report"
    }
    
    var body: some View {
        VStack {
            Picker("Report Type", selection: $selectedReportType) {
                ForEach(ReportType.allCases, id: \.self) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            switch selectedReportType {
            case .lowStock:
                LowStockReportView(items: viewModel.lowStockItems)
            case .expirationDate:
                ExpirationDateReportView(items: viewModel.expiringItems)
            case .valueReport:
                ValueReportView(items: viewModel.inventoryItems)
            }
        }
        .navigationTitle("Stock Report")
        .onAppear {
            viewModel.fetchInventoryItems()
        }
    }
}

struct LowStockReportView: View {
    let items: [InventoryItem]
    
    var body: some View {
        List(items) { item in
            HStack {
                Text(item.name)
                Spacer()
                Text("Quantity: \(item.quantity)")
                    .foregroundColor(.red)
            }
        }
    }
}

struct ExpirationDateReportView: View {
    let items: [InventoryItem]
    
    var body: some View {
        List(items) { item in
            HStack {
                Text(item.name)
                Spacer()
                Text("Expires: \(item.expirationDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A")")
                    .foregroundColor(item.isExpiringSoon ? .orange : .primary)
            }
        }
    }
}

struct ValueReportView: View {
    let items: [InventoryItem]
    
    var totalValue: Double {
        items.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    var body: some View {
        VStack {
            Text("Total Inventory Value: $\(totalValue, specifier: "%.2f")")
                .font(.headline)
                .padding()
            
            List(items) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text("Value: $\(item.price * Double(item.quantity), specifier: "%.2f")")
                }
            }
        }
    }
}

struct StockReportView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StockReportView(viewModel: InventoryViewModel())
        }
    }
}
