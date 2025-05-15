//
//  Account.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import Foundation

struct Account: Identifiable {
    let id = UUID()
    let name: String
    var records: [Record] = []
}
