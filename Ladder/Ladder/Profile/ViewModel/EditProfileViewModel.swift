//
//  EditProfileViewModel.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import PhotosUI
import Firebase
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    
    @Published var selectedProfImage: PhotosPickerItem? {
        didSet { Task { await loadProfImage(fromItem: selectedProfImage) } }
    }
    
    @Published var selectedBackImage: PhotosPickerItem? {
        didSet { Task { await loadBackImage(fromItem: selectedBackImage) } }
    }
    
    @Published var profileImage: Image?
    @Published var backgroundImage: Image?
    
    @Published var fullname: String = ""
    @Published var headline: String = ""
    @Published var location: String = ""
    
    private var uiImage: UIImage?
    private var backUiImage: UIImage?
    
    init(user: User) {
        self.user = user
        self.fullname = user.fullname
        self.location = user.location ?? ""
        self.headline = user.headline ?? ""
    }
    
    //Update ProfileImages
    @MainActor
    func loadProfImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    //Upload Background Image
    @MainActor
    func loadBackImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let backUiImage = UIImage(data: data) else { return }
        self.backUiImage = backUiImage
        self.backgroundImage = Image(uiImage: backUiImage)
    }
    
    //Update String Data
    func updateUserData() async throws {
        var data = [String: Any]()
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        if let backUiImage = backUiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: backUiImage)
            data["backgroundImageUrl"] = imageUrl
        }
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        if !location.isEmpty && user.location != location {
            data["location"] = location
        }
        if !headline.isEmpty && user.headline != headline {
            data["headline"] = headline
        }
        
        if !data.isEmpty {
            try await FirestoreConstants.UserCollection.document(user.id).updateData(data)
        }
    }
}

