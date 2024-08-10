import SwiftUI

struct CustomReportBuilderView: View {
    @StateObject private var viewModel = CustomReportViewModel()
    @State private var selectedDataSources: Set<DataSource> = []
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var reportName = ""

    var body: some View {
        Form {
            Section(header: Text("Report Name")) {
                TextField("Enter report name", text: $reportName)
            }

            Section(header: Text("Date Range")) {
                DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                DatePicker("End Date", selection: $endDate, displayedComponents: .date)
            }

            Section(header: Text("Data Sources")) {
                ForEach(DataSource.allCases, id: \.self) { source in
                    MultipleSelectionRow(title: source.rawValue, isSelected: selectedDataSources.contains(source)) {
                        if selectedDataSources.contains(source) {
                            selectedDataSources.remove(source)
                        } else {
                            selectedDataSources.insert(source)
                        }
                    }
                }
            }

            Section {
                Button("Generate Report") {
                    viewModel.generateReport(name: reportName, startDate: startDate, endDate: endDate, dataSources: Array(selectedDataSources))
                }
                .disabled(reportName.isEmpty || selectedDataSources.isEmpty)
            }
        }
        .navigationTitle("Custom Report Builder")
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: Text(alertItem.title),
                  message: Text(alertItem.message),
                  dismissButton: .default(Text("OK")))
        }
    }
}

enum DataSource: String, CaseIterable {
    case sales = "Sales"
    case inventory = "Inventory"
    case employees = "Employees"
    case customers = "Customers"
}

struct MultipleSelectionRow: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                if isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct CustomReportBuilderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomReportBuilderView()
        }
    }
}
