import SwiftUI

struct ReportingDashboardView: View {
    @StateObject private var viewModel = ReportingViewModel()
    @State private var selectedReportType: ReportType = .sales

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
            case .sales:
                SalesReportView(data: viewModel.salesData)
            case .inventory:
                InventoryReportView(data: viewModel.inventoryData)
            case .employees:
                EmployeeReportView(data: viewModel.employeeData)
            }

            NavigationLink(destination: CustomReportBuilderView()) {
                Text("Create Custom Report")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Reporting Dashboard")
        .onAppear {
            viewModel.fetchReportData()
        }
    }
}

enum ReportType: String, CaseIterable {
    case sales = "Sales"
    case inventory = "Inventory"
    case employees = "Employees"
}

struct SalesReportView: View {
    let data: [SalesDataPoint]

    var body: some View {
        VStack {
            Text("Sales Report")
                .font(.headline)
            List(data) { dataPoint in
                HStack {
                    Text(dataPoint.date)
                    Spacer()
                    Text("$\(dataPoint.amount, specifier: "%.2f")")
                }
            }
        }
    }
}

struct InventoryReportView: View {
    let data: [InventoryDataPoint]

    var body: some View {
        VStack {
            Text("Inventory Report")
                .font(.headline)
            List(data) { dataPoint in
                HStack {
                    Text(dataPoint.itemName)
                    Spacer()
                    Text("\(dataPoint.quantity)")
                }
            }
        }
    }
}

struct EmployeeReportView: View {
    let data: [EmployeeDataPoint]

    var body: some View {
        VStack {
            Text("Employee Report")
                .font(.headline)
            List(data) { dataPoint in
                HStack {
                    Text(dataPoint.name)
                    Spacer()
                    Text("\(dataPoint.hoursWorked) hours")
                }
            }
        }
    }
}

struct ReportingDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ReportingDashboardView()
        }
    }
}
