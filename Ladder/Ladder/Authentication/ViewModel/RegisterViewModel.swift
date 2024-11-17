//
//  RegisterView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//


import Foundation

@MainActor
class RegistrationViewModel: ObservableObject {
    @Published  var fullname = ""
    @Published  var username = ""
    @Published  var email = ""
    @Published  var password = ""
    
    private let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    
    func createUser() async -> String? {
        do {
            return try await authManager.createUser(email: email, password: password, username: username, fullname: fullname)
        } catch {
            return nil
        }
    }
}
