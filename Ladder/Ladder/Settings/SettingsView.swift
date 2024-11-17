//
//  SettingsView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI


struct SettingsView: View {
    
    @State var width = UIScreen.main.bounds.width
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        VStack{
            VStack{
                ZStack{
                    Text("Settings")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                    
                    HStack{
                        Button{
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                            Text("Back")
                            Spacer()
                        }
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .bold()
                        
                        
                        //                            Image(systemName: "questionmark.circle.fill")
                        //                                .foregroundColor(.gray)
                        //                                .font(.system(size: 20))
                        
                    }
                }
                .padding(.horizontal)
                //Spacer()
            }
            
            ScrollView {
                VStack{
                    
                    HStack{
                        Image(systemName: "person")
                            .bold()
                            .padding(.leading, 25)
                        
                        Text("Account")
                            .font(.subheadline)
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right.circle")
                            .padding(.trailing, 25)
                        
                    }
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1.0)
                            .frame(width: width*0.9, height: 40)
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical)
                    
                    
                    HStack{
                        Image(systemName: "star")
                            .bold()
                            .padding(.leading, 25)
                        
                        Text("Membership")
                            .font(.subheadline)
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right.circle")
                            .padding(.trailing, 25)
                        
                    }
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1.0)
                            .frame(width: width*0.9, height: 40)
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical)
                    
                    HStack{
                        Image(systemName: "person.2")
                            .bold()
                            .padding(.leading, 25)
                        
                        Text("QR Code / Invite your friends")
                            .font(.subheadline)
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right.circle")
                            .padding(.trailing, 25)
                        
                    }
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1.0)
                            .frame(width: width*0.9, height: 40)
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical)
                    
                    HStack{
                        Image(systemName: "globe.asia.australia")
                            .bold()
                            .padding(.leading, 25)
                        
                        Text("Area")
                            .font(.subheadline)
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right.circle")
                            .padding(.trailing, 25)
                        
                    }
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1.0)
                            .frame(width: width*0.9, height: 40)
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical)
                    
                    HStack{
                        Image(systemName: "bell")
                            .bold()
                            .padding(.leading, 25)
                        
                        Text("Notification")
                            .font(.subheadline)
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right.circle")
                            .padding(.trailing, 25)
                        
                    }
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1.0)
                            .frame(width: width*0.9, height: 40)
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical)
                    
                    HStack{
                        Image(systemName: "info.circle")
                            .bold()
                            .padding(.leading, 25)
                        
                        Text("About")
                            .font(.subheadline)
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right.circle")
                            .padding(.trailing, 25)
                        
                    }
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1.0)
                            .frame(width: width*0.9, height: 40)
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical)
                    
                    
                    HStack{
                        Image(systemName: "questionmark.circle")
                            .bold()
                            .padding(.leading, 25)
                        
                        Text("Help")
                            .font(.subheadline)
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right.circle")
                            .padding(.trailing, 25)
                        
                    }
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1.0)
                            .frame(width: width*0.9, height: 40)
                            .foregroundStyle(.gray)
                    }
                    .padding(.top)
                    
                }
                .padding(.top,20)
                
            }
            VStack{
                
                
                Button{
                    authManager.signOut()
                }label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: width*0.9, height: 45)
                            .foregroundColor(.black)
                            .opacity(0.1)
                        HStack{
                            Spacer()
                            Text("Log Out")
                                .foregroundColor(.red)
                            Spacer()
                        }
                        .padding(.horizontal, width*0.1)
                        .frame(height: 30)
                    }
                    
                }
                
                Text("Version 0.0.0 - Production")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .padding(.top, 12)
            }
        }
        
        
        
    }
}

#Preview {
    SettingsView()
}
