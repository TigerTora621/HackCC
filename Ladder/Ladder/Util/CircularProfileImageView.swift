//
//  CircularProfileImageView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    case profile
    case post
    case message
    case editprof
    
    var dimension: CGFloat {
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 64
        case .large:
            return 80
        case .profile:
            return 90
        case .post:
            return 54
        case .message:
            return 32
        case .editprof:
            return 100
        }
    }
}

struct CircularProfileImageView: View {
    
    var user: User?
    let size: ProfileImageSize
    
    var body: some View {
        
        if let imageUrl = user?.profileImageUrl, !imageUrl.isEmpty {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            ZStack {
                Circle() // 白い円を背景として追加
                    .fill(Color.white)
                    .frame(width: size.dimension, height: size.dimension)
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.dimension, height: size.dimension)
                    .clipShape(Circle()) // アイコンを丸くクリップ
                    .foregroundColor(Color(.systemGray4))
            }
        }
        
    }
}


