import SwiftUI

struct ContentView: View {
    @StateObject private var authViewModel = AuthenticationViewModel()
    
    var body: some View {
        Group {
            if authViewModel.isAuthenticated {
                MainTabView()
            } else {
                LoginView()
            }
        }
        .environmentObject(authViewModel)
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                OrderListView()
            }
            .tabItem {
                Label("Orders", systemImage: "list.bullet")
            }
            
            NavigationView {
                MenuDashboardView()
            }
            .tabItem {
                Label("Menu", systemImage: "menucard")
            }
            
            NavigationView {
                SalesDashboardView()
            }
            .tabItem {
                Label("Sales", systemImage: "chart.bar.xaxis")
            }
            
            NavigationView {
                InventoryDashboardView()
            }
            .tabItem {
                Label("Inventory", systemImage: "cube.box")
            }
            
            MoreView()
                .tabItem {
                    Label("More", systemImage: "ellipsis.circle")
                }
        }
    }
}

struct MoreView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CustomerListView()) {
                    Label("Customers", systemImage: "person.2")
                }
                NavigationLink(destination: EmployeeListView()) {
                    Label("Employees", systemImage: "person.3")
                }
                NavigationLink(destination: ReportingDashboardView()) {
                    Label("Reports", systemImage: "chart.pie")
                }
                NavigationLink(destination: SettingsView()) {
                    Label("Settings", systemImage: "gear")
                }
            }
            .navigationTitle("More")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
