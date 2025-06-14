//
//  AuthenticationCoordinatorView.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/06/25.
//

import SwiftUI

struct AuthenticationCoordinatorView: View {
    @Bindable var coordinator: AuthenticationCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {}
                .navigationDestination(for: AuthenticationCoordinator.Step.self) { step in
                    switch step {
                    case .register:
                        RegisterView(coordinator: self.coordinator)
                    case .personalInformation:
                        Text("Personal Information")
                    case .success:
                        Text("Success")
                    case .login:
                        LoginView(coordinator: self.coordinator)
                    }
                }
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    AuthenticationCoordinatorView(coordinator: AuthenticationCoordinator())
}
