//
//  LoginView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//



import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    private let authManager: AuthManager

    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    func signIn() async {
        do {
            try await authManager.login(withEmail: email, password: password)
        } catch {
            print("failed to login")
        }
    }
    
}
