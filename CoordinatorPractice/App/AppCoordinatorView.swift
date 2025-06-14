//
//  ContentView.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import SwiftUI

struct AppCoordinatorView: View {
    @Bindable var coordinator: AppCoordinator
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: ViewTab.home.rawValue) {
                AccountCoordinatorView(coordinator: self.coordinator.accountCoordinator)
            }
            
            Tab("Settings", systemImage: ViewTab.settings.rawValue) {
                SettingsView(coordinator: self.coordinator)
            }
        }
        .fullScreenCover(isPresented: $coordinator.authenticationCoordinator.askForAuthentication) {
            AuthenticationCoordinatorView(coordinator: coordinator.authenticationCoordinator)
        }
    }
}

#Preview {
    AppCoordinatorView(coordinator: AppCoordinator())
}
