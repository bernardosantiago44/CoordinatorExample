//
//  Record.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import Foundation

struct Record: Identifiable {
    let id = UUID()
    let title: String
    let amount: Double
    let date: Date
    let category: String
}
