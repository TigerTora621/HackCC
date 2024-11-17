//
//  ProjectView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//


import SwiftUI

struct ProjectView: View {
    
    let user: User
    
    var body: some View {
        
        VStack {
            HStack{
                Image(systemName: "moon")
                    .bold()
                    .padding(.leading)
                
                Text("Projects")
                    .bold()
                    .font(.title3)
                
                Spacer()

            }
            
            Text("working on making life multi-planetary, advancing sustainable energy solutions, and exploring new frontiers in AI and neurotechnology. I’m always looking for extraordinary engineers and visionaries to join me on these ambitious journeys.")
                .padding(.horizontal)
                .font(.callout)
        }
    }
}
