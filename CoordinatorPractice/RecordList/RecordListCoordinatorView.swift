//
//  RecordListCoordinatorView.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import SwiftUI

struct RecordListCoordinatorView: View {
    @Bindable var coordinator: RecordListCoordinator
    
    var body: some View {
        NavigationView {
            RecordListView(viewModel: coordinator.viewModel)
                .navigationTitle(Text("Record List"))
                .tint(.primary)
                .toolbar {
                    Button {
                        withAnimation(.easeOut) {
                            self.coordinator.viewModel.addRecord()
                        }
                    } label: {
                        Label("Add Record", systemImage: "plus.circle.fill")
                    }
                }
                .sheet(item: $coordinator.selectedRecord, onDismiss: {
                    coordinator.closeRecordDetail()
                }) { record in
                    RecordDetailView(record: record) {
                        coordinator.closeRecordDetail()
                    }
                }
        }
    }
}

#Preview {
    RecordListCoordinatorView(coordinator: RecordListCoordinator(recordService: RecordService()))
}
