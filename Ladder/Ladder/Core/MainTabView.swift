//
//  MainTabView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    
    @State private var selectedIndex = 0
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    var body: some View {
        
        
        VStack {
            
            TabView(selection: $selectedIndex) {
                
                
                
                FeedView(user: user)
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "globe" )
                            .bold()
                    }
                    .tag(0)
                
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                            .bold()
                    }
                    .tag(1)
                
                ChatListView()
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "ellipsis.message")
                            .bold()
                    }
                    .tag(2)
                
                NotificationView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "bell")
                            .bold()
                    }
                    .tag(3)
                
                MyProfileView(user: user)
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "person")
                            .bold()
                    }
                    .tag(4)
                
            }
            .navigationTitle(tabTitle)
            .navigationBarTitleDisplayMode(.inline)
            .accentColor(Color(.systemIndigo))
            .onChange(of: selectedIndex) {
                simpleSuccess()
            }
            
        }
        
    }
    
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Search"
        case 2: return "Message"
        case 3: return "Notification"
        case 4: return "Profile"
        default: return ""
        }
    }
}


