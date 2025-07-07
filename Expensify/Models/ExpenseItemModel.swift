//
//  ExpenseItemModel.swift
//  Expensify
//
//  Created by jatin foujdar on 07/07/25.
//
import Foundation


struct ExpenseItem: Codable, Identifiable{
    var id = UUID()
    let name: String
    let type: String
    let amaount: Double
}
