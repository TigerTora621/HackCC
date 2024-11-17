//
//  UploadPostView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//


import SwiftUI
import PhotosUI

struct UploadPostView: View {
    //@EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    @State private var caption = ""
    @State private var imagePickerPresented = false
    
    @StateObject var viewModel = UploadPostViewModel()
    
    let user: User
    
    var body: some View {
        
        VStack{
            VStack{
                HStack{
                    Button{
                        clearPostData()
                    }label: {
                        Text("Cancel")
                    }
                    .padding(.leading)
                    Spacer()
                    
                    Button{
                        Task {
                            try await viewModel.uploadPost(caption: caption)
                            clearPostData()
                        }
                    } label: {
                        Text("POST")
                            .foregroundColor(.white)
                            .font(.headline)
                            .font(.system(size: 6))
                            .frame(width: 60, height: 30)
                            .background(Color.indigo)
                            .clipShape(Capsule())
                            .padding()
                        
                    }
                }
                
                HStack{
                    CircularProfileImageView(user: user, size: .small)
                        .padding(.leading, 6)
                    
                    Spacer()
                }
                
                VStack(alignment: .center) {
                    if let image = viewModel.postImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 250)
                            .cornerRadius(15)
                    }
                }
                
                
                MultiLineTextField(text: $caption)
                    .padding(.horizontal, 8)
                
            }
            Spacer()
            
            HStack{
                Button {
                    imagePickerPresented.toggle()
                } label: {
                    Image(systemName: "photo.artframe")
                        .padding(.leading)
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)
                }
                Spacer()
                Button{
                    hideKeyboard()
                } label: {
                    Text("Done")
                        .padding(.trailing, 15)
                        .padding(.bottom,5)
                        .foregroundColor(.gray)
                }
                
            }
        }
        .navigationBarHidden(true)
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
        
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    func clearPostData() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        dismiss()
    }
}
