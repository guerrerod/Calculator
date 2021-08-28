//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Daniel Guerrero on 8/28/21.
//

import SwiftUI

struct CalculatorButton: View {
    
    let text:String
    let actionOnScreen: () -> Void
    
    var body: some View {
        
        
        Button(action: actionOnScreen, label: {
            Spacer()
            VStack
            {
            Spacer()
                Text(text).font(.system(size: 40))
            Spacer()
            }
            Spacer()

        })
   
    
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(text: "7", actionOnScreen:{})
    }
}
