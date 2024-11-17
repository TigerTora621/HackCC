//
//  FirestoreConstants.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import Firebase

struct FirestoreConstants {
    private static let Root = Firestore.firestore()
    
    static let UserCollection = Root.collection("users")
    
    static let PostCollection = Root.collection("posts")
    
}
