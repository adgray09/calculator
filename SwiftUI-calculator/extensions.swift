//
//  extensions.swift
//  SwiftUI-calculator
//
//  Created by alex on 2/6/21.
//

import Foundation

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
