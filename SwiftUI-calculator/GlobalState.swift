//
//  GlobalState.swift
//  SwiftUI-calculator
//
//  Created by alex on 2/6/21.
//

import Foundation

class GlobalState: ObservableObject {
    @Published var display = "0"
    
    var storedValue: Double? = nil
    var operation: CalculatorKey? = nil
    var beginInput = true
    
    func keyPressed(key: CalculatorKey) {
        switch key {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            if beginInput {
                display = key.rawValue
                beginInput = false
            } else {
                display = display + key.rawValue
            }
        
        case .add, .minus, .multiply, .divide:
            // if stored value == nil
                // stored value = Double(display)
                // operation = key
                // beginInput = true
        if storedValue == nil {
            storedValue = Double(display)
            operation = key
            beginInput = true
        } else {
            if beginInput {
                operation = key
            } else {
                calculate()
                beginInput = true
                operation = key
            }
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
    func calculate() {
        let a = storedValue ?? 0
        let b = Double(display) ?? 0
        var answer: Double = 0
        
        switch operation {
        case .add:
            answer = a + b
        case .minus:
            answer = a - b
        case .multiply:
            answer = a * b
        case .divide:
            answer = a / b
        default:
            break
        }
        
        storedValue = answer
        display = String(answer)
    }
}
