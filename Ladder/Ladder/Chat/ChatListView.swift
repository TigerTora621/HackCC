//
//  ChatListView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI

struct ChatListView: View {
    @StateObject var viewModel = SearchViewModel()
    
    
    var body: some View {
        NavigationStack{
            VStack {
                // スクロールビュー
                UserListView(config: .chat,showToolbar: false)
                    .navigationBarBackButtonHidden()
                
            }

        }
        .navigationDestination(for: Destination.self) { destination in
            switch destination {
            case .profileView(let user):
                ProfileView(user: user)
            case .chatView(let user):
                ChatView(user: user)
            }
        }

    }
}

#Preview {
    ChatListView()
}
