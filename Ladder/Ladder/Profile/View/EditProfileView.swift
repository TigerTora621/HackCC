//
//  File.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @State private var selectedProfImage: PhotosPickerItem?
    @State private var selectedBackImage: PhotosPickerItem?
    
    @State private var width = UIScreen.main.bounds.width
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var userManager: UserManager
    
    @StateObject var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
 
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    HStack {
                        BackButton()
                    }
                    Text("Edit Profile")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                }
 
                
                Spacer()
            }
            VStack {
                VStack {
                    
                    PhotosPicker(selection: $viewModel.selectedProfImage) {
                        if let Profimage = viewModel.profileImage {
                            ZStack(alignment: .bottomTrailing) {
                                Profimage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(50)
                                ZStack {
                                    ZStack {
                                        Circle()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.black)
                                        Circle()
                                            .frame(width: 26, height: 26)
                                            .foregroundColor(.white)
                                        Circle()
                                            .frame(width: 26, height: 26)
                                            .foregroundColor(.black)
                                            .opacity(0.1)
                                    }
                                    Image(systemName: "camera.fill")
                                        .font(.system(size: 14))
                                        .shadow(color: .white, radius: 1, x: 1, y: 1)
                                        .foregroundColor(.black)
                                }
                            }
                        } else {
                            ZStack(alignment: .bottomTrailing) {
                                CircularProfileImageView(user: viewModel.user, size: .editprof)
                                ZStack {
                                    ZStack {
                                        Circle()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.black)
                                        Circle()
                                            .frame(width: 26, height: 26)
                                            .foregroundColor(.white)
                                        Circle()
                                            .frame(width: 26, height: 26)
                                            .foregroundColor(.black)
                                            .opacity(0.1)
                                    }
                                    Image(systemName: "camera.fill")
                                        .font(.system(size: 14))
                                        .shadow(color: .white, radius: 1, x: 1, y: 1)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
                .padding(.top, 25)
                
                VStack {
                    
                    PhotosPicker(selection: $viewModel.selectedBackImage) {
                        if let Backimage = viewModel.backgroundImage {
                            ZStack(alignment: .bottomTrailing) {
                                Backimage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width * 0.95, height: 100)
                                    .cornerRadius(2)
                                ZStack {
                                    ZStack {
                                        Circle()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.black)
                                        Circle()
                                            .frame(width: 26, height: 26)
                                            .foregroundColor(.white)
                                        Circle()
                                            .frame(width: 26, height: 26)
                                            .foregroundColor(.black)
                                            .opacity(0.1)
                                    }
                                    Image(systemName: "camera.fill")
                                        .font(.system(size: 14))
                                        .shadow(color: .white, radius: 1, x: 1, y: 1)
                                        .foregroundColor(.black)
                                }
                            }
                        } else {
                            ZStack(alignment: .bottomTrailing) {
                                BackImageView(user: viewModel.user)
                                ZStack {
                                    ZStack {
                                        Circle()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.black)
                                        Circle()
                                            .frame(width: 26, height: 26)
                                            .foregroundColor(.white)
                                        Circle()
                                            .frame(width: 26, height: 26)
                                            .foregroundColor(.black)
                                            .opacity(0.1)
                                    }
                                    Image(systemName: "camera.fill")
                                        .font(.system(size: 14))
                                        .shadow(color: .white, radius: 1, x: 1, y: 1)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
                
                VStack {
                    VStack {
                        Rectangle()
                            .frame(width: width * 0.9, height: 2)
                            .foregroundColor(.black)
                            .opacity(0.3)
                        
                        HStack {
                            HStack {
                                Text("Full Name")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16))
                                
                                Spacer()
                            }
                            .frame(width: width * 0.22)
                            
                            HStack {
                                TextField("Your name", text: $viewModel.fullname)
                                    .font(.system(size: 16))
                                    .placeholder(when: viewModel.fullname.isEmpty) {
                                        Text("Your name").foregroundColor(.gray).font(.system(size: 16))
                                    }
                                    .foregroundColor(.black)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                            }
                            .frame(width: width * 0.63)
                        }
                        
                        Rectangle()
                            .frame(width: width * 0.9, height: 2)
                            .foregroundColor(.black)
                            .opacity(0.3)
                        
                        HStack {
                            HStack {
                                Text("Location")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)
                            
                            HStack {
                                TextField("Your location", text: $viewModel.location)
                                    .font(.system(size: 16))
                                    .placeholder(when: viewModel.location.isEmpty) {
                                        Text("Your location").foregroundColor(.gray).font(.system(size: 16))
                                    }
                                    .foregroundColor(.black)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                            }
                            .frame(width: width * 0.63)
                        }
                        
                        Rectangle()
                            .frame(width: width * 0.9, height: 2)
                            .foregroundColor(.black)
                            .opacity(0.3)
                        
                        VStack{
                            
                            HStack {
                                Text("Headline")
                                    .padding(.leading, 30)
                                    .padding(.bottom, -7)
                                    .foregroundColor(.black)
                                    .padding(.top, 5)
                                Spacer()
                                
                                Button{
                                    hideKeyboard()
                                } label: {
                                    Text("Done")
                                        .padding(.trailing, 30)
                                        .padding(.bottom,-5)
                                        .foregroundColor(.teal)
                                }
                                
                            }
                            
                            if #available(iOS 16, *) {
                                ZStack(alignment: .topLeading) {
                                    // RoundedRectangleを背景として使用
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.black)
                                        .frame(height: 300)
                                        .padding(.horizontal)
                                    
                                    // TextEditorのプレースホルダを表示するためのテキスト
                                    if viewModel.headline.isEmpty {
                                        Text("Write about you.")
                                            .foregroundColor(Color(.systemGray))
                                            .font(.system(size: 16))
                                            .padding(.top, 8)
                                            .padding(.leading, 24)
                                    }
                                    
                                    // TextEditor自体
                                    TextEditor(text: $viewModel.headline)
                                        .foregroundColor(.black)
                                        .background(Color.clear) // 背景を透明に
                                        .frame(height: 300)
                                        .padding(.horizontal)
                                        .scrollContentBackground(.hidden)
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.94)
                                .padding(.top, -1)
                            }
                            
                            
                        }
                        
                        .padding(.top, 4)
                    }
                    .padding(.horizontal, width * 0.05)
                    .padding(.top, 24)
                    
                    Spacer()
                }
                .padding(.top, -10)
                
                Button {
                    Task {
                        try await viewModel.updateUserData()
                        await userManager.fetchCurrentUser()
                    }
                    dismiss()
                    
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .background(Color.teal)
                        .cornerRadius(13)
                        .padding(.vertical)
                }
            }
        }
        
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
