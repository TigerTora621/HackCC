//
//  PassionView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//


import SwiftUI

struct PassionView: View {
    
    let user: User
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "flame")
                    .bold()
                    .padding(.leading)
                
                Text("Passion")
                    .bold()
                    .font(.title3)
                
                Spacer()
  
            }
            
            Text("No Passion")
                .padding(.horizontal)
                .font(.callout)
        }
    }
}
