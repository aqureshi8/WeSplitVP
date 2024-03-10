//
//  ContentView.swift
//  WeSplitVP
//
//  Created by Ahsan Qureshi on 3/10/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var amount: Double = 0.0
    @State private var peopleCount: Int = 2
    @State private var tipPercentage: Int = 20
    
    let currencyCode = Locale.current.currency?.identifier ?? "USD"
    let tipAmounts = [15, 20, 25, 0]
    
    var total: Double {
        amount * Double(100 + tipPercentage) / 100
    }
    var amountPerPerson: Double {
        total / Double(peopleCount)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Bill Amount") {
                    TextField("Amount",
                              value: $amount,
                              format: .currency(code: currencyCode))
                    .keyboardType(.decimalPad)
                    Picker("People Count", selection: $peopleCount) {
                        ForEach(1..<99, id: \.self) {
                            Text("\($0) People")
                        }
                    }
                }
                Section("Tip Percentage") {
                    Picker("Tip Perecentage", selection: $tipPercentage) {
                        ForEach(tipAmounts, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Total") {
                    Text(total, format: .currency(code: currencyCode))
                }
                Section("Amount per person") {
                    Text(amountPerPerson, format: .currency(code: currencyCode))
                }
            }
            .navigationTitle("WeSplit App")
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
