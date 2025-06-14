//
//  HomeCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/06/25.
//

import Foundation

enum ViewTab: String {
    case home = "house"
    case settings = "gear"
}

@Observable class HomeCoordinator {
    var tab: ViewTab = .home
    var accountCoordinator: AccountCoordinator!
    var authenticationCoordinator: AuthenticationCoordinator!
    
    init(recordService: RecordService) {
        self.accountCoordinator = AccountCoordinator(recordService: recordService)
        self.authenticationCoordinator = AuthenticationCoordinator()
    }
}
