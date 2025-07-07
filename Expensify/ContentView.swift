//
//  ContentView.swift
//  Expensify
//
//  Created by jatin foujdar on 04/07/25.
//
//  ContentView.swift
//  Expensify
//
//  Created by Jatin Foujdar on 04/07/25.
//

import SwiftUI

struct ContentView: View {

        @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Total Budget: ")
                    // TextField("Total Budget", text: $totalBudgetText)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                
                HStack {
                    Image(systemName: remainingAmount() < 0 ? "exclamationmark.triangle.fill" : "checkmark.circle.fill")
                        .foregroundColor(remainingAmount() < 0 ? .red : .green)
                    
                    Text("Remaining: \(remainingAmount(), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                        .font(.title2)
                }
                
                List {
                    Section(header: Text("Personal")){
                        ForEach(expenses.items.filter{ $0.type == "Personal"}){item in
                            expenseRow(for: item)
                        }
                        .onDelete{offsets in
                            removeItems(for: "Personal" at: offsets)
                        }
                    }
                    Section(header: "Business"){
                        ForEach(expenses.items.filter{$0.type == "Business"}){item in
                            expenseRow(for: item)
                        }
                        .onDelete{offsets in
                            removeItem(for: "Business", at: offsets)
                            
                        }
                    }
                }
            }
        }
        .navigationTitle("Expensify")
        .toolbar {
            ToolbarItem(placement: .topBarLeading){
                Button{
                    showAddExpense = true
                }label: {
                    Label("Add Expense",systemImage: "plus"))
                }
            }
            ToolbarItem(placement: .topTrailing){
                navigationLink(destination: ExpenseChartView(expenseSummary: expenseSummary, totalExpense: totalBudget)){label in
                    Label("View Chart", systemImage: "chart.pie.fill")
                }
            }
        }
        .sheet(isPresented: $showingAddExpense){
            AddView(expenses: expenses)
        }
    }
}

#Preview {
    ContentView()
}

