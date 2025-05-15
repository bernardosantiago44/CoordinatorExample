//
//  RecordListView.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import SwiftUI

struct RecordListView: View {
    @Bindable var viewModel: RecordListViewModel
    private let currencyCode = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        if viewModel.records.isEmpty {
            ContentUnavailableView("No records found", systemImage: "questionmark.circle")
        } else {
            List {
                RecordList()
            }
            .animation(.easeOut, value: viewModel.records.isEmpty)
        }
    }
    
    @ViewBuilder
    private func RecordList() -> some View {
        ForEach(viewModel.records) { record in
            Button {
                viewModel.selectRecord(record)
            } label: {
                VStack(alignment: .leading) {
                    Text(record.title).font(.headline)
                    Text(Formatters.formatCurrency(record.amount)).font(.caption)
                    Text(record.category).font(.caption).foregroundStyle(.secondary)
                }
            }
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                Button("Delete", role: .destructive) {
                    withAnimation(.easeOut) {
                        self.viewModel.removeRecord(record)
                    }
                }
                .tint(.red)
            }
        }
    }
}

#Preview {
    AppCoordinatorView(coordinator: AppCoordinator())
}
