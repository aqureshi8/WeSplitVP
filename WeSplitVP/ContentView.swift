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
   
    var total: Double {
        amount * Double(100 + tipPercentage) / 100
    }
    var amountPerPerson: Double {
        total / Double(peopleCount)
    }
    
    var body: some View {
        NavigationStack {
            Spacer()
            Section("Bill Amount") {
                TextField("Amount",
                          value: $amount,
                          format: .currency(code: currencyCode))
                Picker("People Count", selection: $peopleCount) {
                    ForEach(1..<99, id: \.self) {
                        Text("\($0) People")
                    }
                }
            }
            Spacer()
            Section("Tip Percentage") {
                Picker("Tip Perecentage", selection: $tipPercentage) {
                    ForEach(1..<101, id: \.self) {
                        Text($0, format: .percent)
                    }
                }
                .pickerStyle(.navigationLink)
            }
            Spacer()
            Section("Total") {
                Text(total, format: .currency(code: currencyCode))
            }
            Spacer()
            Section("Amount per person") {
                Text(amountPerPerson, format: .currency(code: currencyCode))
            }
            Spacer()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
