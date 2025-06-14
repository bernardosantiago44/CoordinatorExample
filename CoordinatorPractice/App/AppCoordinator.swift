//
//  AppCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import Foundation

@Observable class AppCoordinator {
    let recordService = RecordService()
    let accountCoordinator: AccountCoordinator!
    var authenticationCoordinator: AuthenticationCoordinator!
    
    var tab: ViewTab = .home
    
    init() {
        self.accountCoordinator = AccountCoordinator(recordService: self.recordService)
        self.authenticationCoordinator = AuthenticationCoordinator()
    }
}
