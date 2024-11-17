//
//  PostService.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//


import Foundation
import Firebase
import FirebaseStorage
import FirebaseAuth

struct PostService {
    
    private static let postsCollection = Firestore.firestore().collection("posts")
    
    //Fetch posts in FeedView by time-order.
    //Fetch user info about each posts. using loop.
    static func fetchFeedPosts() async throws -> [Post] {
        //fetch posts
        let snapshot = try await postsCollection.order(by: "timestamp", descending: true).getDocuments()
        var posts = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
        //fetch user
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        return posts
    }
    
}




