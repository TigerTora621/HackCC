//
//  UserListViewModel.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/17/24.
//

import Foundation

@MainActor
class UserListViewModel: ObservableObject {
    @Published var users = [User] ()
    
    init() {
        print("DEBUG: init userListViewModel")
    }
    
    
    func fetchUsers(forConfig config: UserListConfig) async {
        do {
            self.users = try await UserService.fetchUsers(forConfig: config)
            
        } catch {
            print("DEBUG: Failed to fetchUser \(error.localizedDescription)")
        }
    }
}
