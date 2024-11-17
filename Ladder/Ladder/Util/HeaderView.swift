//
//  HeaderView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI

struct HeaderView: View {
    
    @State private var showProf = false
    var body: some View {
        VStack {
            HStack {
                Text("ladder")
                    .foregroundColor(.indigo)
                    .fontWeight(.bold)
                    .font(.custom("Caveat-Bold", size: 27))
                    .padding(.vertical, -5)
                    .padding(.leading, 7)
 
                Spacer()
                
                NavigationLink {
                    SettingsView().navigationBarBackButtonHidden()
                } label: {
                    Image(systemName: "gearshape")
                        .bold()
                        .padding(.trailing)
                        .foregroundColor(.black)
                }
            }
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundColor(.gray)
        }

    }
}

