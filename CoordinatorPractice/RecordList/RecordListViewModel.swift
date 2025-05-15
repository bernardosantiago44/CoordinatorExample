//
//  RecordListViewModel.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import SwiftUI

@Observable class RecordListViewModel {
    var records: [Record]
    
    @ObservationIgnored private let recordService: RecordService
    @ObservationIgnored private unowned let coordinator: RecordListCoordinator // Prevents strong references since RecordListCoordinator owns RecordListViewModel
    
    init(recordService: RecordService, coordinator: RecordListCoordinator) {
        self.recordService = recordService
        self.coordinator = coordinator
        
        self.records = recordService.records
        // Subscribe to updates from the record service
        
    }
    
    @MainActor
    func addRecord() {
        let newRecord = Record(title: "New Record", amount: 0, date: .now, category: "Misc")
        self.records.append(newRecord)
    }
    
    func selectRecord(_ record: Record) {
        coordinator.openRecordDetail(for: record)
    }
    
    func removeRecord(at indexSet: IndexSet) {
        records.remove(atOffsets: indexSet)
    }
    
    func removeRecord(_ record: Record) {
        self.records.removeAll { $0.id == record.id }
    }
}
