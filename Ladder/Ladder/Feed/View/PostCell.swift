//
//  PostCell.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI
import Kingfisher

struct PostCell: View {
    
    @ObservedObject var viewModel: PostCellViewModel
    
    init(post: Post) {
        self.viewModel = PostCellViewModel(post: post)
    }
    
    private var post: Post {
        return viewModel.post
    }

    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    var body: some View {
        
        
        VStack {
            HStack(alignment: .top, spacing: 10) {
                
                
                
                if let user = post.user {
                    NavigationLink(value: Destination.profileView(user)) {
                        CircularProfileImageView(user: user, size: .small)                                .padding(.leading, 1)
                    }
                }
                
                
                
                
                
                NavigationLink(value: post) {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            if let user = post.user{
                                Text(user.fullname)
                                    .foregroundColor(.primary)
                                    .fontWeight(.bold)
                            }
                            
                            Spacer()
                            
                            Text(post.timestamp.timestampString()) // timeAgoString() に変更
                                .foregroundColor(.gray)
                                .padding(.trailing)
                                .fontWeight(.light)
                        }
                        
                        Text(post.caption ?? "")
                            .frame(maxHeight: 100, alignment: .leading)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                        
                        if let imageUrl = post.imageUrl, !imageUrl.isEmpty {
                            GeometryReader { proxy in
                                KFImage(URL(string: post.imageUrl ?? ""))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: proxy.frame(in: .global).width, height: 250)
                                    .cornerRadius(15)
                            }
                            .frame(height: 250)
                        }
                        
                    }
                }
            }
            
            HStack(spacing: 70) {
                Button {
                    simpleSuccess()
                } label: {
                    Image(systemName: "bubble.left")
                        .frame(width: 16, height: 16)
                        .foregroundColor(.gray)
                }
                
                Button {
                    simpleSuccess()
                } label: {
                    Image(systemName:  "hand.thumbsup")
                        .foregroundColor( .gray)
                        .frame(width: 16, height: 16)
                }
                
                
                
                Button {
                    print("Share from here")
                    simpleSuccess()
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .frame(width: 16, height: 16)
                        .foregroundColor(.gray)
                }
                
                
            }
            .padding(.top, 4)
 
        }
        .padding(.vertical, -9)
 
    }
    

    
}


