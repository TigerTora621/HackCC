//
//  UserListConfig.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/17/24.
//

import Foundation

enum UserListConfig: Hashable {
    case explore
    case chat
    
    
    var navigationTitle: String {
        switch self {
        case .explore: return "Explore"
        case .chat: return "Chat"
        }
    }
}
