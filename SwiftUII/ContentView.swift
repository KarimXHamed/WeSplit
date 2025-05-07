//
//  ContentView.swift
//  SwiftUII
//
//  Created by Karim Hamed  on 04/05/2025.
//

import SwiftUI



struct ContentView: View {
    @State private var amount = 0.0
    @State private var unitToConvert:LengthUnits = .m
    @State private var convertedUnit:LengthUnits = .m
    @FocusState private var amountIsFocused : Bool
    let tipPercentages = [10,15,20,25,0]
    
    var convertedvalue:Double {
            let valueInMeters = amount * unitToConvert.rawValue
            let finalValue = valueInMeters / convertedUnit.rawValue
            return finalValue
    }
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $amount,format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("From unit", selection:$unitToConvert) {
                        ForEach(LengthUnits.allCases) { unit in
                            Text(unit.displayName).tag(unit)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section {
                    Text(convertedvalue, format: .number)
                    Picker("From unit", selection:$convertedUnit) {
                        ForEach(LengthUnits.allCases) { unit in
                            Text(unit.displayName).tag(unit)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                }
                .navigationTitle("We convert")
                
                
            }
        }
    }
}

enum LengthUnits: Double, CaseIterable, Identifiable {
    
    case m = 1.0
    case km = 1000.0
    case feet = 0.3048
    case yard = 0.9144
    case mile = 1609.34

    var displayName: String {
        switch self {
        case .m: return "Meters"
        case .km: return "Kilometers"
        case .feet: return "Feet"
        case .yard: return "Yards"
        case .mile: return "Miles"
        }
    }
    
    var id: UUID {
        return UUID()
    }

    
    
    func convert(_ value: Double, to targetUnit: LengthUnits) -> Double {
           let valueInMeters = value * self.rawValue
           return valueInMeters / targetUnit.rawValue
       }
    
}

#Preview {
    ContentView()
}
