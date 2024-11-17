//
//  MyProfileView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI

struct MyProfileView: View {
    
    @State private var showEditProfile = false
    @ObservedObject var viewModel: ProfileViewModel
    @State private var showChatView = false
    
    private var user: User {
        return viewModel.user
    }
    
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                GeometryReader { geometry in
                    VStack {
                        // Back Button
                        // Profile and Background Image Section
                        ZStack(alignment: .bottomLeading) {
                            BackImageView(user: user)
                                .padding(.vertical)
                                .zIndex(0)
                            
                            HStack {
                                CircularProfileImageView(user: user, size: .profile)
                                    .padding(.leading, 20)
                                    .padding(.top, 45)
                                    .zIndex(1.0)
                                Spacer()
                            }
                        }
                        
                        // Name and Button Section
                        HStack {
                            Text(user.fullname)
                                .font(.title3)
                                .bold()
                                .padding(.leading)
                            
                            Spacer()
                            
                            Button {
                                showEditProfile.toggle()
                                
                            } label: {
                                Text("Edit")
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                                    .padding(.trailing, 5)
                            }
                        }
                        
                        // College and Location Section
                        HStack {
                            Text("Orange Coast College")
                                .font(.subheadline)
                                .padding(.leading)
                            
                            Spacer()
                            
                        }
                        
                        HStack {
                            Text("Computer Science")
                                .font(.footnote)
                                .foregroundColor(Color(.systemGray))
                                .padding(.leading)
                            
                            Spacer()
                            
                            HStack(spacing: 2){
                                Text("22")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                                
                                Text("Ladders")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            }
                            .padding(.trailing, 5)
                            
                            }
                    }
                    .frame(width: geometry.size.width) // Adjust to geometry width
                    .padding(.bottom, -10)
                }
                .frame(height: 230) // Constrain GeometryReader height
                
                // Profile Sections
                ScrollView {
                    ProfileSectionView(user: user)
                        .padding(.top, 10)
                }
                .frame(maxWidth: .infinity)
                .navigationBarBackButtonHidden()
                
            }
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user: user)
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
