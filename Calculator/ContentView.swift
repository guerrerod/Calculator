//
//  ContentView.swift
//  Calculator
//
//  Created by Daniel Guerrero on 8/23/21.
//

import SwiftUI

struct ContentView: View {
    @State var textOnScreen = ""
    @State var newEquation:Bool = false
    @State var newDecimal:Bool = false
    
    @State var zeroPress:Bool = false
    @State var allowZeros:Bool = false
    
    var body: some View {
        
        VStack(spacing: 0)
        {
            
            HStack(spacing: 0)
            {
                ZStack
                {
                    Rectangle().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text(textOnScreen).font(.system(size: 40))
                }
            }
            
            
            HStack(spacing: 0)
            {
               
                GeometryReader
                { proxy in
                
                    HStack
                    {
                        
                        CalculatorButton(text: "clear")
                        {
                            textOnScreen = ""
                            newDecimal = false
                            newEquation = false
                            zeroPress = false
                        }.frame(width: proxy.size.width*0.75)
                        
                        CalculatorButton(text: "/")
                        {
                            scrubber(operand:"/")
                            newEquation = false
                            newDecimal = false
                        }
                    }
                }
      
                
            }
            HStack(spacing: 0)
            {
                CalculatorButton(text: "7")
                {
                    buttonChecker(appendee: "7")
                }
                
                CalculatorButton(text: "8")
                {
                    buttonChecker(appendee: "8")
                }
                
                CalculatorButton(text: "9")
                {
                    buttonChecker(appendee: "9")
                }
                
                CalculatorButton(text: "*")
                {
                    scrubber(operand:"*")
                    newEquation = false
                    newDecimal = false
                }
            
            
            }
            HStack(spacing: 0)
            {
                CalculatorButton(text: "4")
                {
                    buttonChecker(appendee: "4")
                }
                
                CalculatorButton(text: "5")
                {
                    buttonChecker(appendee: "5")
                }
                
                CalculatorButton(text: "6")
                {
                    buttonChecker(appendee: "6")
                }
                
                CalculatorButton(text: "-")
                {
                    scrubber(operand:"-")
                    newEquation = false
                    newDecimal = false
                }
            }
            HStack(spacing: 0)
            {
                CalculatorButton(text: "1")
                {
                    buttonChecker(appendee: "1")
                }
                
                CalculatorButton(text: "2")
                {
                    buttonChecker(appendee: "2")
                }
                
                CalculatorButton(text: "3")
                {
                    buttonChecker(appendee: "3")
                }
                
                CalculatorButton(text: "+")
                {
                    scrubber(operand:"+")
                    newEquation = false
                    newDecimal = false
                }
            }
            HStack(spacing: 0)
            {
                GeometryReader
                { proxy in
                
                    HStack
                    {
                        
                        CalculatorButton(text: "0")
                        {
                            zeroPress = true
                            zeroChecker(input: "0")
                        }.frame(width: proxy.size.width*0.5)
                        
                        CalculatorButton(text: ".")
                        {
                            if newDecimal == false
                            {
                            scrubber(operand:".")
                            }
                            else
                            {
                                return
                            }
                            
                            newEquation = false
                        }
                        
                        CalculatorButton(text: "=")
                        {
                            let equals = CalculateMath(text: textOnScreen, finalAnswer: $textOnScreen)
                            if textOnScreen == ""
                            {
                                return
                            }
                            if textOnScreen.last?.isNumber == false
                            {
                                return
                            }
                            
                            equals.parser()
                            equals.calculate()
                            newEquation = true
                            newDecimal = true
                            allowZeros = false
                            
                        }
                    
                    }
                }
            
            }
            
            
        }.ignoresSafeArea()
        
        
    }
    
    func scrubber(operand:String)
    {
        if textOnScreen.last?.isNumber == true
        {
        textOnScreen.append(operand)
        }
        
        else
        {
            if textOnScreen != ""
            {
                textOnScreen.removeLast()
                textOnScreen.append(operand)
            }
            else
            {
                return
            }
        }
       
        allowZeros = true
    }
    
    
    func buttonChecker(appendee:String)
    {
        if newEquation == false
        {
            textOnScreen.append(appendee)
        }
        else
        {
            textOnScreen = ""
            newEquation = false
            textOnScreen.append(appendee)
        }
        
        
        
    }
    
    func zeroChecker(input:String)
    {
        if (zeroPress == true && allowZeros == true) || (textOnScreen == "" && zeroPress == true)
        {
            textOnScreen.append(input)
        }
        else
        {
            return
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
