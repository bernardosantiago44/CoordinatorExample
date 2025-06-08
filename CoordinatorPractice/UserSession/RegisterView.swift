//
//  RegisterView.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 26/05/25.
//

import SwiftUI

struct RegisterView: View {
    @Bindable var coordinator: AuthenticationCoordinator
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("user\u{200B}@email.com", text: $coordinator.viewModel.email)
                    .textContentType(.emailAddress)
                    .textCase(.lowercase)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedTextFieldStyle(headerText: "email",
                                                          systemImage: "envelope"))
                
                TextField("password", text: $coordinator.viewModel.password)
                    .textContentType(.newPassword)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedTextFieldStyle(headerText: "password",
                                                          systemImage: "key"))
                
                PasswordRequirementsChecklist(metRequirements: self.coordinator.viewModel.passwordValidationResult.met)
                
                TextField("confirm_password", text: $coordinator.viewModel.confirmPassword)
                    .textContentType(.newPassword)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedTextFieldStyle(headerText: "confirm_password",
                                                          systemImage: "key"))
                
                if coordinator.viewModel.isBusy {
                    ProgressView()
                } else {
                    Button("Create account") {
                        Task {
                            await coordinator.viewModel.signup()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(!coordinator.viewModel.isValidEntry(requiresConfirmation: true))
                }
            }
            .padding(.horizontal)
            .animation(.easeOut, value: coordinator.viewModel.isBusy)
        }
        .navigationTitle("register")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Error", isPresented: $coordinator.showErrorMessage) {
            
        } message: {
            Text(coordinator.errorMessage ?? "Unknown error occurred.")
        }

    }
}

#Preview {
    NavigationStack {
        RegisterView(coordinator: AuthenticationCoordinator())
    }
}
