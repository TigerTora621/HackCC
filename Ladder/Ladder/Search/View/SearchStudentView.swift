//
//  SearchStudentView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/17/24.
//

import SwiftUI

struct SearchStudentView: View {
    
    @State private var searchText = ""
    @State var isEditing = false
    @StateObject var viewModel = SearchViewModel()
    
    // 検索テキストに基づいたフィルタリング機能
    var filteredUsers: [User] {
        if searchText.isEmpty {
            return viewModel.users
        } else {
            return viewModel.users.filter { user in
                user.fullname.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        VStack {
            // スクロールビュー
            UserListView(config: .explore,showToolbar: false)
                .navigationBarBackButtonHidden()
            
        }
        
    }
    
}
