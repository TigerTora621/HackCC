//
//  ContentView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var userManager: UserManager
    var body: some View {
        VStack {
            Group {
                if authManager.userSession == nil {
                    LoginView(authManager: authManager, userManager: userManager)
                } else if let currentUser = userManager.currentUser{
                    MainTabView(user: currentUser)
                }
            }
            .task(id: authManager.userSession) {
                guard authManager.userSession != nil else { return }
                await userManager.fetchCurrentUser()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
