//
//  Extension.swift
//  Expensify
//
//  Created by jatin foujdar on 08/07/25.
//

import SwiftUI

private func expenseRow(for item: ExpenseItem) -> some View {
    HStack{
        VStack(alignment: .leading){
            Text(item.name)
                .font(.headline)
        }
        Spacer()
        Text(
            item.amaount,
            format: .currency(code: Locale.current.currency?.identifier ?? "Rupee")
        )
    }
}
