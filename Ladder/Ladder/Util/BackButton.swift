//
//  BackButton.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var mode
    
    
    var body: some View {
        HStack{
            Button(action: { mode.wrappedValue.dismiss()},label: { Image(systemName: "chevron.left")
                Text("Back")
                Spacer()
            })
            .foregroundColor(.gray)
            .font(.subheadline)
            .bold()
        }
        .padding(.leading)
    }
}

#Preview {
    BackButton()
}
