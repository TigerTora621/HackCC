//
//  UserManager.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import Foundation
import FirebaseFirestore

@MainActor
class UserManager: ObservableObject {
    @Published var currentUser: User?
    
    private let service: UserService
    
    init(service: UserService) {
        self.service = service
    }
    
    func fetchCurrentUser() async {
        do {
            self.currentUser = try await service.fetchCurrentUser()
            
        } catch {
            print("DEBUG: Failed to fetch currentuser with error \(error)")
        }
    }
    
    func uploadUserData(uid: String, username: String, email: String, fullname: String) async throws {
        let user = User(id: uid, username: username, email: email, fullname: fullname)
        try await service.uploadUserData(user)
        self.currentUser = user
    }
    
}
