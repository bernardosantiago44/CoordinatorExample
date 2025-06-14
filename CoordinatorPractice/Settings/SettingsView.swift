//
//  SettingsView.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/06/25.
//

import SwiftUI

struct SettingsView: View {
    @Bindable var coordinator: AppCoordinator; #warning("In the future, we want a SettingsCoordinator")
    
    var body: some View {
        NavigationStack {
            List {
                Text("Email: ") + Text(coordinator.authenticationCoordinator.viewModel.user?.email ?? "Not logged in")
                Button("Sign out") {
                    Task {
                        await coordinator.authenticationCoordinator.viewModel.logout()
                    }
                }
                .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    SettingsView(coordinator: AppCoordinator())
}
