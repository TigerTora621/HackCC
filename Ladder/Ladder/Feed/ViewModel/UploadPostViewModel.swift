//
//  UploadPostViewModel.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//



import Foundation
import PhotosUI
import SwiftUI
import FirebaseAuth
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var postImage: Image?
    private var uiImage: UIImage?
    
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    
    func uploadPost(caption: String?) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let postRef = FirestoreConstants.PostCollection.document()
        var imageUrl: String? = nil
        
        // Only execute the upload if an image is selected.
        if let uiImage = uiImage {
            imageUrl = try await ImageUploader.uploadImage(image: uiImage)
        }
        
        // If there is no image or caption, do not create a post.
        guard imageUrl != nil || !(caption?.isEmpty ?? true) else {
            print("DEBUG: Image or caption is required.")
            return
        }
        
        let post = Post(
            id: postRef.documentID,
            ownerUid: uid,
            caption: caption ?? "",
            likes: 0,
            commentCount: 0,
            imageUrl: imageUrl,
            timestamp: Timestamp()
        )
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
    }
    
}
