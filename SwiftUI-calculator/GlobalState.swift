//
//  GlobalState.swift
//  SwiftUI-calculator
//
//  Created by alex on 2/6/21.
//

import Foundation




class GlobalState: ObservableObject {
    @Published var display = "0"
    
    func keyPressed(key: CalculatorKey) {
        switch key {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            if display == CalculatorKey.zero.rawValue {
                display = key.rawValue
            } else {
                display = display + key.rawValue
            }
        case .dot:
            if display.contains(CalculatorKey.dot.rawValue) {
                break
            } else {
                display = display + CalculatorKey.dot.rawValue
            }
        case .plusMinus:
            if display[0] == CalculatorKey.minus.rawValue {
                display.remove(at: display.startIndex)
            } else {
                display = CalculatorKey.minus.rawValue + display
            }
        case .allClear, .clear:
            display = CalculatorKey.zero.rawValue
            
        default: break
        }
    }
}
