//
//  CommunityView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//



import SwiftUI

struct CommunityView: View {
    
    let user: User
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "link")
                    .bold()
                    .padding(.leading)
                
                Text("Community")
                    .bold()
                    .font(.title3)
                
                Spacer()
 
            }
            
            Text("Committed to fostering communities that thrive on collaboration, innovation, and diversity.")
                .padding(.horizontal)
                .font(.callout)
        }
        
    }
}
