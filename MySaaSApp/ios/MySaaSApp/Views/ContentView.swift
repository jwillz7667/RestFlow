import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: OrderListView()) {
                    Text("Orders")
                }
                NavigationLink(destination: MenuDashboardView()) {
                    Text("Menu")
                }
                NavigationLink(destination: SalesDashboardView()) {
                    Text("Sales")
                }
                NavigationLink(destination: InventoryDashboardView()) {
                    Text("Inventory")
                }
                NavigationLink(destination: CustomerListView()) {
                    Text("Customers")
                }
                NavigationLink(destination: EmployeeListView()) {
                    Text("Employees")
                }
                NavigationLink(destination: ReportingDashboardView()) {
                    Text("Reports")
                }
                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                }
            }
            .navigationBarTitle("MySaaSApp")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
