//
//  SearchViewModel.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/17/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        let users = try await UserService.fetchAllUsers()
        print("Fetched Users: \(users)")
        self.users = users
    }
}
