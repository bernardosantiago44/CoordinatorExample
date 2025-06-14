//
//  LoginView.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/06/25.
//

import SwiftUI

struct LoginView: View {
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
                
                RegisterButtonLink
                
                if coordinator.viewModel.isBusy {
                    ProgressView()
                } else {
                    Button("Login") {
                        Task {
                            await coordinator.viewModel.login()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(!coordinator.viewModel.isValidEntry(requiresConfirmation: false))
                }
            }
            .padding(.horizontal)
            .animation(.easeOut, value: coordinator.viewModel.isBusy)
        }
        .navigationTitle("Sign in")
        .navigationBarBackButtonHidden()
        .alert("Error", isPresented: $coordinator.showErrorMessage) {
            
        } message: {
            Text(coordinator.errorMessage ?? "Unknown error occurred.")
        }
    }
    
    private var RegisterButtonLink: some View {
        HStack {
            Text("Are you new in here?")
            Button("Sign up") {
                coordinator.navigateTo(.register)
            }
        }
    }
}

#Preview {
    NavigationStack {
        LoginView(coordinator: AuthenticationCoordinator())
    }
}
