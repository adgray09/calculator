//
//  SwiftUI_calculatorApp.swift
//  SwiftUI-calculator
//
//  Created by alex on 2/3/21.
//

import SwiftUI

@main
struct SwiftUI_calculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(GlobalState())
        }
    }
}
