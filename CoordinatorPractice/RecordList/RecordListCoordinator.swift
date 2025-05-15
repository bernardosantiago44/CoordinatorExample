//
//  RecordListCoordinator.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import Foundation

@Observable class RecordListCoordinator {
    @ObservationIgnored
    let recordService: RecordService
    
    var selectedRecord: Record?
    
    var viewModel: RecordListViewModel!
    
    init(recordService: RecordService) {
        self.recordService = recordService
        self.viewModel = .init(recordService: recordService, coordinator: self)
    }
    
    func openRecordDetail(for record: Record) {
        self.selectedRecord = record
    }
    
    func closeRecordDetail() {
        self.selectedRecord = nil
    }
}
