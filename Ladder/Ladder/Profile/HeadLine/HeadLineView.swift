//
//  HeadLineView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI

struct HeadlineView: View {
    
    let user: User
    
    var body: some View {
        Text(user.headline ?? "No headline")
            .padding(.horizontal)
    }
}
