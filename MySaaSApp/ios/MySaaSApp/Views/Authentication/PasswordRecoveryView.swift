import SwiftUI

struct PasswordRecoveryView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            Image(systemName: "key.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
                .padding(.bottom, 50)

            Text("Enter your email address to reset your password")
                .multilineTextAlignment(.center)
                .padding()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .padding()

            Button(action: resetPassword) {
                Text("Reset Password")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
        .navigationBarTitle("Password Recovery", displayMode: .large)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Password Reset"), message: Text(alertMessage), dismissButton: .default(Text("OK")) {
                if alertMessage.contains("sent") {
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }

    private func resetPassword() {
        authViewModel.resetPassword(email: email) { result in
            switch result {
            case .success:
                alertMessage = "Password reset instructions have been sent to your email."
                showingAlert = true
            case .failure(let error):
                alertMessage = error.localizedDescription
                showingAlert = true
            }
        }
    }
}

struct PasswordRecoveryView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordRecoveryView().environmentObject(AuthenticationViewModel())
    }
}
