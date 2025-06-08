//
//  AuthenticationCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 26/05/25.
//

import Foundation

@Observable class AuthenticationCoordinator {
    var viewModel: AuthenticationViewModel!
    var errorMessage: String?
    var showErrorMessage = false
    
    init() {
        self.viewModel = AuthenticationViewModel(coordinator: self)
    }
    
    func displayError(message: String) {
        self.errorMessage = message
        self.showErrorMessage = true
    }
    
    func dismissError() {
        self.showErrorMessage = false
        self.errorMessage = nil
    }
    
}
