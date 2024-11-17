//
//  SearchView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @State var isEditing = false
    
    @State var searchMenu = "college"
    
    
    var body: some View {
        NavigationStack{
            VStack{
                
                ZStack{
                    VStack{
                        ZStack{
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width, height: 30)
                                .foregroundColor(.white)
                            
                            VStack{
                                HStack(spacing: 50){
                                    
                                    Text("College")
                                        .foregroundColor(.indigo)
                                        .font(.headline)
                                        .padding(.leading,65)
                                        .opacity(searchMenu == "college" ? 1 : 0.5)
                                        .onTapGesture {
                                            self.searchMenu = "college"
                                        }
                                    
                                    
                                    Spacer()
                                    
                                    Text("Student")
                                        .foregroundColor(.indigo)
                                        .font(.headline)
                                        .padding(.trailing, 65)
                                        .opacity(searchMenu == "student" ? 1 : 0.5)
                                        .onTapGesture {
                                            self.searchMenu = "student"
                                        }
                                    
                                }

                            }
                        }
                    }
                }
                
                
                if searchMenu == "college" {
                    SearchCollegeView()
                }
                else if searchMenu == "student" {
                    SearchStudentView()
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


#Preview {
    SearchView()
}

