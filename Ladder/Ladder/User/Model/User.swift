//
//  User.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//



import SwiftUI
import Firebase
import FirebaseAuth

struct User: Identifiable, Codable, Hashable{
    let id: String
    var username: String
    var email: String
    var fullname: String
    var profileImageUrl: String?
    var backgroundImageUrl: String?
    var headline: String?
    var location: String?
    
    //I could implement thosse variable if I have more time. User can edit their info in EditProfileView
//    var college: String?
//    var major: String?
//    var collegeDescription: String?
//    var skillDescription: String?
//    var languageDescription: String?
//    var passionDescription: String?
//    var experienceDescription: String?
//    var communityDescription: String?
//    var projectDescription: String?
//    var awardDescription: String?
    
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
    
}



