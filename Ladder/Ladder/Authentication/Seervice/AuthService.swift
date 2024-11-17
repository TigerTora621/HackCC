//
//  AuthService.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import FirebaseAuth
import FirebaseFirestore

//AuthService is responsible for login, register, signOut. Using firebase framework.
class AuthService {
    func login(withEmail email: String, password: String) async throws -> String {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return result.user.uid
    }
    
    func createUser(email: String,password: String,username: String,fullname: String) async throws -> String {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        return result.user.uid
        
    }
    
    func signout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    
    
}
