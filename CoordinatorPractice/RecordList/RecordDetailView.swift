//
//  RecordDetailView.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import SwiftUI

struct RecordDetailView: View {
    var record: Record
    let onClose: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Text(record.title).font(.largeTitle).fontWeight(.semibold)
                Text(Formatters.formatCurrency(record.amount))
                Text(record.category).font(.headline)
                Text(record.date, style: .date)
            }
            .padding()
            .navigationTitle("Record Detail")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Close") {
                    onClose()
                }
            }
        }
    }
}

#Preview {
    RecordDetailView(record: RecordService().records.first!, onClose: {})
}
