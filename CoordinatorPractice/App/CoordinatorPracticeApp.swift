//
//  CoordinatorPracticeApp.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import SwiftUI

@main
struct CoordinatorPracticeApp: App {
    @State private var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(coordinator: self.appCoordinator)
        }
    }
}
