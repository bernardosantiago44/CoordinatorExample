//
//  UsersDatabase.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 26/05/25.
//

import Foundation
import Auth

class UsersDatabase {
    private let dbURL: URL
    static let shared = UsersDatabase()
    
    private init() {
        @EnvironmentKey("DATABASE_URL") var databaseUrlString: String
        self.dbURL = URL(string: databaseUrlString)!
    }
    
    func insertUser(user: User) async throws {
        /// Create a URLRequest for the POST request.
        let usersRoute =  dbURL.appending(path: "users")
        var request = URLRequest(url: usersRoute)
        
        /// Configure the HTTP method.
        request.httpMethod = "POST"
        
        /// Configure the proper content-type value to JSON.
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        /// Define the struct of data and encode it to data.
        let postData = UserAttributes(id: user.id, email: user.email ?? "unknown")
        let jsonData = try JSONEncoder().encode(postData)
        
        /// Pass in the data as the HTTP body.
        request.httpBody = jsonData
        
        /// Use URLSession to fetch the data asynchronously.
        _ = try await URLSession.shared.data(for: request)
    }
}

extension UsersDatabase {
    struct UserAttributes: Encodable {
        var id: UUID
        var email: String
    }
}
