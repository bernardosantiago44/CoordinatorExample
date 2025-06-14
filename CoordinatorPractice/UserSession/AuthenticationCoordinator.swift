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
    var askForAuthentication = true
    
    var path: [Step] = []
    
    init() {
        self.viewModel = AuthenticationViewModel(coordinator: self)
        path.append(.login)
        
        self.askForAuthentication = self.viewModel.user == nil
    }
    
    func displayError(message: String) {
        self.errorMessage = message
        self.showErrorMessage = true
    }
    
    func dismissError() {
        self.showErrorMessage = false
        self.errorMessage = nil
    }
    
    func navigateTo(_ step: Step) {
        if step == .login {
            self.popToRoot()
        }
        self.path.append(step)
    }
    
    func popToRoot() {
        self.path = [.login]
    }
    
    func goBack() {
        guard self.path.count > 1 else { return }
        self.path.removeLast()
    }
    
}

extension AuthenticationCoordinator {
    enum Step: Hashable {
        case register
        case login
        case personalInformation
        case success
    }
}
