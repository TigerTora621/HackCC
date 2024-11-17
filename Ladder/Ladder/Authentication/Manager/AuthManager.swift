//
//  AuthManager.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import FirebaseAuth

@MainActor
class AuthManager: ObservableObject {
    @Published var userSession: String?
    
    private let service: AuthService
    
    init(service: AuthService) {
        self.userSession = Auth.auth().currentUser?.uid
        self.service = service
    }
    
    func createUser(email: String, password: String, username: String, fullname: String) async throws -> String? {
        do {
            self.userSession = try await service.createUser(email: email, password: password, username: username, fullname: fullname)
            return self.userSession
        } catch {
                throw error
        }
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            self.userSession = try await service.login(withEmail: email, password: password)
        } catch {
            
        }
    }
    
    func signOut() {
        service.signout()
        self.userSession = nil
    }
}

