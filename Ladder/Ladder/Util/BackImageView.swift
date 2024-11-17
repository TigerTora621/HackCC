//
//  BackImageView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI
import Kingfisher

struct BackImageView: View {
    
    let user: User?
    
    init (user:User?) {
        self.user = user
    }
    
    var body: some View {
        
        if let imageUrl = user?.backgroundImageUrl , !imageUrl.isEmpty {
            KFImage(URL(string: imageUrl))
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 120)
            
        } else {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 120)
                .foregroundColor(.black)
        }
        
        
        
    }
}


