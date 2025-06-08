//
//  Validator.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 08/06/25.
//

import Foundation


final class Validator {
    public static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return email.range(of: emailRegex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    enum PasswordRequirement: String, CaseIterable, Identifiable {
        var id : String { rawValue }
        
        case length = "At least 8 characters"
        case uppercase = "At least one uppercase letter"
        case lowercase = "At least one lowercase letter"
        case digit = "At least one digit"
        case specialChar = "At least one special character"
        
    }
    
    /// Validates a password's security requirements.
    /// Returns: `(isValid: Bool, met: Set<PasswordRequirement>, unmet: Set<PasswordRequirement>)`.
    ///
    static func validatePassword(password: String) -> (isValid: Bool, met: Set<PasswordRequirement>, unmet: Set<PasswordRequirement>) {
        var metRequirements: Set<PasswordRequirement> = []
        
        if password.count >= 8 {
            metRequirements.insert(.length)
        }
        if password.range(of: "[A-Z]", options: .regularExpression) != nil {
            metRequirements.insert(.uppercase)
        }
        if password.range(of: "[a-z]", options: .regularExpression) != nil {
            metRequirements.insert(.lowercase)
        }
        if password.range(of: "\\d", options: .regularExpression) != nil {
            metRequirements.insert(.digit)
        }
        if password.range(of: "[\\@#\\$%\\^&\\*\\(\\)_\\+\\-=!]", options: .regularExpression) != nil {
            metRequirements.insert(.specialChar)
        }
        
        let allRequirements = Set(PasswordRequirement.allCases)
        let unmetRequirements = allRequirements.subtracting(metRequirements)
        let isValid = unmetRequirements.isEmpty
        
        return (isValid, metRequirements, unmetRequirements)
    }
    
}

