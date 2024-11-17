//
//  SkillView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//



import SwiftUI

struct SkillView: View {
    
    let user: User
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "list.bullet.rectangle.portrait")
                    .bold()
                    .padding(.leading)
                
                Text("Skills")
                    .font(.title3)
                    .bold()
                
                Spacer()
                
            }
            
            Text("Product Vision and  Strategy Software Engineering (C++, Python) Leadership and Team Building Artificial Intelligence and Machine Learning")
                .padding(.horizontal)
                .font(.callout)
        }
    }
}
