//
//  CurrencyFormatter.swift
//  CoordinatorPractice
//
//  Created by Bernardo Santiago Marin on 14/05/25.
//

import Foundation

class Formatters {
    private static let locale = Locale.current
    private static let currencyCode = locale.currency?.identifier ?? "USD"
    
    private static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        return formatter
    }()
    
    public static func formatCurrency(_ amount: Double) -> String {
        return currencyFormatter.string(from: NSNumber(value: amount)) ?? "0.00"
    }
}
