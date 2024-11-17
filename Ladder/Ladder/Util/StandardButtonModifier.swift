//
//  StandardButtonModifier.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI

struct StandardButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: UIScreen.main.bounds.width*0.9, height: 44)
            .background(Color(.systemIndigo))
            .cornerRadius(10)
    }
}
