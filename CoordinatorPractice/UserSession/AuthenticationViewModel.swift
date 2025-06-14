//
//  AuthenticationViewModel.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 26/05/25.
//

import Foundation
import Auth

@Observable class AuthenticationViewModel {
    
    @ObservationIgnored private unowned let coordinator: AuthenticationCoordinator
    
    typealias PasswordRequirementsValidate = (isValid: Bool, met: Set<Validator.PasswordRequirement>, unmet: Set<Validator.PasswordRequirement>)
    
    // MARK: - View state & fields
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var isBusy = false
    var passwordValidationResult: PasswordRequirementsValidate { Validator.validatePassword(password: password) }
    var isEmailValid: Bool { Validator.isValidEmail(self.email) }
    
    func isValidEntry(requiresConfirmation: Bool) -> Bool {
        // Validate email and password requirements
        let passwordValid = self.passwordValidationResult.isValid
        let confirmPasswordValid = password.elementsEqual(confirmPassword)
        
        // Returns true if email and password are valid, and only validates for confirm password when required (registering)
        return (isEmailValid && passwordValid && confirmPasswordValid) || (isEmailValid && passwordValid && !requiresConfirmation)
    }
    
    var subscription: AuthStateChangeListenerRegistration?
    var user: User?
    
    init(coordinator: AuthenticationCoordinator) {
        self.coordinator = coordinator
        self.setupAuthListener()
    }
    
    deinit {
        self.subscription?.remove()
    }
    
    // MARK: - Auth listeners
    private func setupAuthListener() {
        guard subscription == nil else { return }
        Task {
            subscription = await SupabaseInstance.shared.client.auth.onAuthStateChange({ [weak self] _, session in
                self?.user = session?.user
                self?.coordinator.askForAuthentication = session == nil
            })
        }
    }
    
    // MARK: Login Flow
    
    /// Authenticates the user with email and password
    ///
    private func authenticateWithEmail(email: String, password: String) async throws {
        guard self.isEmailValid else {
            throw NSError(domain: "Invalid email format", code: 1001, userInfo: nil)
        }
        
        guard self.passwordValidationResult.isValid else {
            throw NSError(domain: "Password requirements not met", code: 1002, userInfo: nil)
        }
        
        try await SupabaseInstance.shared.client.auth.signIn(
            email: email,
            password: password
        )
    }
    
    private func registerWithEmail(email: String, password: String) async throws -> User {
        let response = try await SupabaseInstance.shared.client.auth.signUp(
            email: email,
            password: password)
        return response.user
    }
    
    // MARK: Sign out Flow
    private func signOut() async throws {
        try await SupabaseInstance.shared.client.auth.signOut()
    }
    
    /// Public method to authenticate the user. Handles errors
    ///
    @MainActor
    public func login() async {
        self.isBusy = true
        defer { self.isBusy = false }
        
        do {
            try await self.authenticateWithEmail(email: self.email, password: self.password)
            self.coordinator.navigateTo(.success)
        } catch {
            self.coordinator.displayError(message: error.localizedDescription)
        }
    }
    
    @MainActor
    public func signup() async {
        self.isBusy = true
        defer { self.isBusy = false }
        
        do {
            let user = try await self.registerWithEmail(email: self.email, password: self.password)
            try await UsersDatabase.shared.insertUser(user: user)
            self.coordinator.navigateTo(.personalInformation)
        } catch {
            self.coordinator.displayError(message: error.localizedDescription)
        }
    }
    
    @MainActor
    public func logout() async {
        self.isBusy = true
        defer { self.isBusy = false }
        
        do {
            try await self.signOut()
        } catch {
            self.coordinator.displayError(message: error.localizedDescription)
        }
    }
}
