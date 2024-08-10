import Foundation
import Combine

class AuthenticationViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var user: User?
    private var cancellables = Set<AnyCancellable>()
    
    private let authService: AuthenticationService
    
    init(authService: AuthenticationService = AuthenticationService.shared) {
        self.authService = authService
        checkAuthStatus()
    }
    
    func login(email: String, password: String) {
        authService.login(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Login error: \(error)")
                    // Handle error (e.g., show alert)
                }
            } receiveValue: { [weak self] user in
                self?.isAuthenticated = true
                self?.user = user
            }
            .store(in: &cancellables)
    }
    
    func logout() {
        authService.logout()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Logout error: \(error)")
                    // Handle error
                }
            } receiveValue: { [weak self] _ in
                self?.isAuthenticated = false
                self?.user = nil
            }
            .store(in: &cancellables)
    }
    
    private func checkAuthStatus() {
        authService.checkAuthStatus()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] status in
                self?.isAuthenticated = status
            }
            .store(in: &cancellables)
    }
}
