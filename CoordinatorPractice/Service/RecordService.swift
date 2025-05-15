//
//  RecordService.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import Foundation

@Observable class RecordService {
    private(set) var records: [Record] = []
    
    init() {
        self.records = [
            Record(title: "Groceries", amount: 50, date: .now, category: "Food"),
            Record(title: "Payment", amount: -100, date: .now, category: "Expense"),
            Record(title: "Salary", amount: 1000, date: .now, category: "Income")
        ]
    }
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func deleteRecord(at index: Int) {
        guard index >= 0 && index < self.records.count else { return }
        self.records.remove(at: index)
    }
    
    func deleteRecord(_ record: Record) {
        records.removeAll { $0.id == record.id }
    }
}
