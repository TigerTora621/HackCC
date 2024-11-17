//
//  ProfileViewModel.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import Foundation

//Responsible for profileView UserIdentification(honestly i could put on View simply.
@MainActor
class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
}

