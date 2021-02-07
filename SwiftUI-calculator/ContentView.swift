//
//  ContentView.swift
//  SwiftUI-Calculator
//
//  Created by alex on 2/3/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var env: GlobalState
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                HStack {
                    Text(env.display)
                        .font(.system(size: 70))
                        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 70, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding(8)
                        .foregroundColor(.white)
                }
                HStack(spacing: 5) {
                    self.makeButton(key: .allClear, color: Color(white: 0.22, opacity: 1.0))
                    self.makeButton(key: .plusMinus, color: Color(white: 0.22, opacity: 1.0))
                    self.makeButton(key: .percent, color: Color(white: 0.22, opacity: 1.0))
                    self.makeButton(key: .divide, color: .orange)
                }
                HStack(spacing: 5) {
                    self.makeButton(key: .seven)
                    self.makeButton(key: .eight)
                    self.makeButton(key: .nine)
                    self.makeButton(key: .multiply, color: .orange)
                }
                HStack(spacing: 5) {
                    self.makeButton(key: .four)
                    self.makeButton(key: .five)
                    self.makeButton(key: .six)
                    self.makeButton(key: .minus, color: .orange)
                }
                HStack(spacing: 5) {
                    self.makeButton(key: .one)
                    self.makeButton(key: .two)
                    self.makeButton(key: .three)
                    self.makeButton(key: .add , color: .orange)
                }
                HStack(spacing: 5) {
                    self.makeButton(key: .zero, width: 146)
                    self.makeButton(key: .dot)
                    self.makeButton(key: .equal, color: .orange)
                }
                
                Spacer(minLength: 10)
            }
        }
    }
    
    func makeButton(key: CalculatorKey = .zero, width: CGFloat = 70, height: CGFloat = 70, color: Color = Color(white: 0.4)) -> some View {
        return AnyView(
            Button(action: {
                env.keyPressed(key: key)
            }, label: {
                Text(key.rawValue)
                    .frame(width: width, height: height, alignment: .center)
                    .background(color)
                    .cornerRadius(35)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(GlobalState())
                
        }
    }
}

