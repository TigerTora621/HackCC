//
//  PostCellViewModel.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/17/24.
//

import Foundation

@MainActor
class PostCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        Task {
        }
    }
  
}
