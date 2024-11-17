//
//  FeedView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//


import SwiftUI
import Firebase

enum Destination: Hashable {
    case profileView(User)
    case chatView(User)
}

struct FeedView: View {
    @State var text = ""
    @State var isEditing = false
    @StateObject var viewModel = FeedViewModel()
    let user: User
    
    @Environment(\.dismissSearch) var dismissSearch
    @Environment(\.isSearching) var isSearching
    
    // フィルタリングされた投稿を計算するプロパティ
    var filteredPosts: [Post] {
        if text.isEmpty {
            return viewModel.posts
        } else {
            return viewModel.posts.filter { post in
                post.caption?.localizedCaseInsensitiveContains(text) ?? false
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView()
                
                HStack {
                    SearchBar(text: $text, isEditing: $isEditing)
                        .padding(.horizontal)
                    
                    if isSearching {
                        Button("Cancel") {
                            text = ""
                            dismissSearch() // 検索を解除
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil) // キーボードを閉じる
                        }
                        .foregroundColor(.blue)
                        .padding(.trailing, 10)
                    }
                }
                
                Spacer()
                
                ZStack {
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVStack(spacing: 18) {
                                ForEach(filteredPosts.indices, id: \.self) { index in   
                                    // フィルタリングされた投稿を表示
                                    PostCell(post: filteredPosts[index])
                                    Divider()
                                }
                            }
                            .padding(.top)
                            .padding(.horizontal)
                            .zIndex(0)
                        }
                    }
                    .padding(.top, -10)
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink {
                                UploadPostView(user: user)
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .background(Color.white)
                                    .foregroundColor(.indigo)
                                    .clipShape(Circle())
                            }
                        }
                        .padding()
                    }
                    .padding(.bottom, 12)
                }
                
                Spacer()
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: 1)
                    .foregroundColor(.gray)
            }
            .onAppear {
                Task {
                    try await viewModel.fetchPosts()
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
}

