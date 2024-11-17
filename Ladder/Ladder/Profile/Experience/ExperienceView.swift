//
//  ExperienceView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//




import SwiftUI

struct ExperienceView: View {
    
    let user: User
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "command")
                    .bold()
                    .padding(.leading)
                
                Text("Experience")
                    .bold()
                    .font(.title3)
                
                Spacer()
               
            }
            
            Text( "I worked Apple for 2 yearrs.")
                .padding(.horizontal)
                .font(.callout)
        }
    }
}
