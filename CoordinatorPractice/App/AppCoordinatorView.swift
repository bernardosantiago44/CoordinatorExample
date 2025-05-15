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
        // For now, we'll show only one Account, so display directly the AccountCoordinatorView.
        // In the future we may have a TabCoordinator
        AccountCoordinatorView(coordinator: self.coordinator.accountCoordinator)
    }
}

#Preview {
    AppCoordinatorView(coordinator: AppCoordinator())
}
