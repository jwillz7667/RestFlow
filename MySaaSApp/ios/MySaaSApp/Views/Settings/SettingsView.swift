import SwiftUI

struct SettingsView: View {
    @State private var taxRate = 0.0
    @State private var currency = "USD"
    @State private var timeZone = TimeZone.current
    
    var body: some View {
        Form {
            Section(header: Text("General Settings")) {
                HStack {
                    Text("Tax Rate")
                    Spacer()
                    TextField("Tax Rate", value: $taxRate, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                }
                
                Picker("Currency", selection: $currency) {
                    Text("USD").tag("USD")
                    Text("EUR").tag("EUR")
                    Text("GBP").tag("GBP")
                    // Add more currencies as needed
                }
                
                Picker("Time Zone", selection: $timeZone) {
                    ForEach(TimeZone.knownTimeZoneIdentifiers, id: \.self) { identifier in
                        Text(identifier)
                            .tag(TimeZone(identifier: identifier) ?? TimeZone.current)
                    }
                }
            }
            
            Section(header: Text("User Management")) {
                NavigationLink(destination: UserRolesView()) {
                    Text("User Roles & Permissions")
                }
            }
            
            Section(header: Text("Integrations")) {
                NavigationLink(destination: IntegrationSettingsView()) {
                    Text("Third-party Integrations")
                }
            }
            
            Section(header: Text("System")) {
                NavigationLink(destination: AuditLogsView()) {
                    Text("Audit Logs")
                }
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
