//
//  AccountCoordinatorView.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import SwiftUI

struct AccountCoordinatorView: View {
    @Bindable var coordinator: AccountCoordinator
    
    var body: some View {
        RecordListCoordinatorView(coordinator: self.coordinator.recordListCoordinator)
    }
}

#Preview {
    AccountCoordinatorView(coordinator: AccountCoordinator(recordService: RecordService()))
}
