//
//  UserService.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import Foundation
import Firebase
import FirebaseAuth


//I couldnot utilize this
enum UserError: Error {
    case invalidUserId
}


struct UserService {
    
    //use everywhere
    func fetchCurrentUser() async throws  -> User {
        guard let uid = Auth.auth().currentUser?.uid else { throw UserError.invalidUserId }
        return try await FirestoreConstants.UserCollection.document(uid).getDocument(as: User.self)
    }
    
    
    //Use searchView
    static func fetchAllUsers() async throws -> [User] {
        
        let snapshot = try await FirestoreConstants.UserCollection.getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: User.self)})
    }
    
    //FetchUser Methods withUID!!
    static func fetchUser(withUid uid: String) async throws -> User {
        
        let snapshot = try await FirestoreConstants.UserCollection.document(uid).getDocument()
        
        return  try snapshot.data(as: User.self)
    }
    
        //Multiple purposes
    private static func fetchUsers(_ snapshot: QuerySnapshot) async throws -> [User] {
        var users = [User]()
        for doc in snapshot.documents {
            let uid = doc.documentID
            users.append( try await fetchUser(withUid: uid))
        }
        
        return users
    }
    
    //Use in RegisterView
    func uploadUserData(_ user: User) async throws {
        let encodedUser = try Firestore.Encoder().encode(user)
        try await FirestoreConstants.UserCollection.document(user.id).setData(encodedUser)
    }
    
    static func fetchUsers(forConfig config: UserListConfig) async throws -> [User] {
        switch config {
        case .explore:
            return try await fetchAllUsers()
        case .chat:
            return try await fetchAllUsers()
            
        }
    }
}




