//
//  SupabaseClient.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 26/05/25.
//

import Foundation
import Supabase

class SupabaseInstance {
    var client: SupabaseClient
    
    private init() {
        @EnvironmentKey("SUPABASE_URL") var urlString: String
        @EnvironmentKey("SUPABASE_ANON_KEY") var anonKey: String
        
        let url = URL(string: urlString)!
        self.client = SupabaseClient(supabaseURL: url,
                                     supabaseKey: anonKey)
    }
    
    static let shared = SupabaseInstance()
}
