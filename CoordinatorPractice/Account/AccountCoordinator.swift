//
//  AccountCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import Foundation

@Observable class AccountCoordinator {
    let recordService: RecordService
    let recordListCoordinator: RecordListCoordinator
    
    init(recordService: RecordService) {
        self.recordService = recordService
        self.recordListCoordinator = RecordListCoordinator(recordService: recordService)
    }
}
