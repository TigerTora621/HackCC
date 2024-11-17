//
//  HonorAwardView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI

struct HonorAwardView: View {
    
    let user: User
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "medal")
                    .bold()
                    .padding(.leading)
                
                Text("Honors&awards")
                    .bold()
                    .font(.title3)
                
                Spacer()
  
            }
            
            Text("Hack.cc-2024 First Prize!!!!!!!")
                .padding(.horizontal)
                .font(.callout)
        }
        
    }
}

