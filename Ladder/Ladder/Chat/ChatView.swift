//
//  ChatView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//
import SwiftUI

struct ChatView: View {
    @Environment(\.dismiss) var dismiss
    let user: User
    var body: some View {
        VStack{
            ScrollView{
                
                    
                    HStack{
                        VStack{
                            
                      CircularProfileImageView(user: user, size: .message)
                                .frame(width: 40, height: 40)
                                .padding(.top, 20)
                                .padding(.leading)
                            
                            Spacer()
                            
                            CircularProfileImageView(user: user, size: .message)
                                .frame(width: 40, height: 40)
                                .padding(.top, 20)
                                .padding(.leading)
                                .padding(.bottom, 80)

                        }
                        Spacer()
                        Image("Chat")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 280)
                            .padding(.trailing, 5)
                        
                        
                    }
                
            }
            
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                HStack{
                    Button(action: { dismiss()},label: { Image(systemName: "chevron.left")
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

