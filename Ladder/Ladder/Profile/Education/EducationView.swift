//
//  EducationView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//



import SwiftUI
import Combine

struct EducationView: View {
    
    
    let user: User
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "graduationcap")
                    .bold()
                    .padding(.leading)
                
                Text("Education")
                    .bold()
                    .font(.title3)
                
                Spacer()
                

            }
            VStack{
                HStack{
                    Text("Orange Coast College")
                        .padding(.leading)
                        .padding(.vertical,-3)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                HStack{
                    Text("Computer Science")
                        .padding(.leading)
                        .padding(.vertical,-3)
                        .foregroundColor(.gray)
                    
                    
                    Spacer()
                }
            }
            
            Text("Dropped out / Computer Science @Harvard University")
                .padding(.horizontal)
                .font(.callout)
        }
        
    }
}

