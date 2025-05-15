//
//  AppCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import Foundation

@Observable class AppCoordinator {
    let recordService = RecordService()
    let accountCoordinator: AccountCoordinator
    
    init() {
        self.accountCoordinator = AccountCoordinator(recordService: self.recordService)
    }
}
