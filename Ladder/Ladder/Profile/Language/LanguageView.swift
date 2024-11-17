//
//  LanguageView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//




import SwiftUI

struct LanguageView: View {
    
    let user: User
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "globe")
                    .bold()
                    .padding(.leading)
                
                Text("Languages")
                    .bold()
                    .font(.title3)
                
                Spacer()
               
            }
            
            Text("● English - Native ● Mandarin - Basic")
                .padding(.horizontal)
                .font(.callout)
        }
    }
}
