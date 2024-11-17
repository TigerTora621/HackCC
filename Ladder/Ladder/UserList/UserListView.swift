//
//  UserListView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/17/24.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel = UserListViewModel()
    @State private var searchText = ""
    @State var isEditing = false
    
    
    private let config: UserListConfig
    var showToolbar: Bool // ToolbarItemの表示を制御するプロパティ
    
    init(config: UserListConfig, showToolbar: Bool = true) {
        self.config = config
        self.showToolbar = showToolbar
    }
    @Environment(\.presentationMode) var mode
    @Environment(\.dismissSearch) var dismissSearch
    @Environment(\.isSearching) var isSearching
    
    // 検索文字列に基づいてユーザーをフィルタリングするプロパティ
    var filteredUsers: [User] {
        if searchText.isEmpty {
            return viewModel.users
        } else {
            return viewModel.users.filter { user in
                user.fullname.localizedCaseInsensitiveContains(searchText) 
            }
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search...", text: $searchText)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if !searchText.isEmpty {
                                Button(action: {
                                    searchText = ""
                                    dismissSearch() // キャンセルして検索解除
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 10)
                
                if isSearching {
                    Button("Cancel") {
                        searchText = ""
                        dismissSearch() // 検索を解除
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil) // キーボードを閉じる
                    }
                    .foregroundColor(.blue)
                    .padding(.trailing, 10)
                }
            }
            
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(filteredUsers) { user in
                        NavigationLink(value: Destination.profileView(user)) {
                            VStack {
                                HStack {
                                    CircularProfileImageView(user: user, size: .post)
                                        .padding(.leading, 10)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(user.fullname)
                                            .foregroundColor(.black)
                                            .fontWeight(.semibold)
                                        
                                        Text("Orange Coast College")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13))
                                        
                                        Text("Computer Science")
                                            .foregroundColor(.blue)
                                            .fontWeight(.light)
                                            .font(.system(size: 10))
                                    }
                                    Spacer()
                                }
                                .contentShape(Rectangle())
                                .padding(.bottom, 5)
                            }
                        }
                    }
                }
            }
            .padding(.top, 5)
            .task {
                await viewModel.fetchUsers(forConfig: config)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar{
            if showToolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Button(action: { mode.wrappedValue.dismiss() }, label: {
                            Image(systemName: "chevron.left")
                            Text("Back")
                            Spacer()
                        })
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .bold()
                    }
                }
            }
        }
    }
}
