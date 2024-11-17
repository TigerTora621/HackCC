//
//  Post.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//



import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String?
    var likes: Int
    var commentCount: Int
    let imageUrl: String?
    let timestamp: Timestamp
    var user: User?
        
}

