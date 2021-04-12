//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Jay Lee on 2021/04/12.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // Mark: - Public
    
    // Check if username and email is available
    // - Parameters
    // -- email : String representing email
    // -- username: String representing username
    
    public func canCreateNewuser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
//     Insert new suer data to databasee
//     - Parameters
//     -- email : String represting email
//     -- username: String representing username
//     -- completion: Async callback for result if database entry succeeded

    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabasekey()).setValue(["username": username]) { error, _ in
            if error == nil {
                // succeeded
                completion(true)
            } else {
                // failed
                completion(false)
            }
        }
    }
    
    // MARK: - Private
    private func safeKey() {
                
    }
}
