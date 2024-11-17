//
//  AppIconImageView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI

struct AppIconImageView: View {
    var body: some View {
        Image("logo")
            .resizable()
            .frame(width: 250, height: 250)
    }
}

#Preview {
    AppIconImageView()
}

