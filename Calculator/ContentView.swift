//
//  ContentView.swift
//  Calculator
//
//  Created by Daniel Guerrero on 8/23/21.
//

import SwiftUI

struct ContentView: View {
    @State var textOnScreen = ""
    
    
    var body: some View {
        
        VStack(spacing: 0)
        {
            
            HStack(spacing: 0)
            {
                ZStack
                {
                    Rectangle().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text(textOnScreen)
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
                        }.frame(width: proxy.size.width*0.75)
                        
                        CalculatorButton(text: "/")
                        {
                            textOnScreen.append("/")
                        }
                
                    
                    
                    }
                }
      
                
            }
            HStack(spacing: 0)
            {
                CalculatorButton(text: "7")
                {
                    textOnScreen.append("7")
                }
                
                CalculatorButton(text: "8")
                {
                    textOnScreen.append("8")
                }
                
                CalculatorButton(text: "8")
                {
                    textOnScreen.append("8")
                }
                
                CalculatorButton(text: "X")
                {
                    textOnScreen.append("X")
                }
            
            
            
            
            
            
            
            
            
            
            }
            HStack(spacing: 0)
            {
                CalculatorButton(text: "4")
                {
                    textOnScreen.append("4")
                }
                
                CalculatorButton(text: "5")
                {
                    textOnScreen.append("5")
                }
                
                CalculatorButton(text: "6")
                {
                    textOnScreen.append("6")
                }
                
                CalculatorButton(text: "-")
                {
                    textOnScreen.append("-")
                }
            }
            HStack(spacing: 0)
            {
                CalculatorButton(text: "1")
                {
                    textOnScreen.append("1")
                }
                
                CalculatorButton(text: "2")
                {
                    textOnScreen.append("2")
                }
                
                CalculatorButton(text: "3")
                {
                    textOnScreen.append("3")
                }
                
                CalculatorButton(text: "+")
                {
                    textOnScreen.append("+")
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
                            textOnScreen.append("0")
                        }.frame(width: proxy.size.width*0.75)
                        
                        CalculatorButton(text: "=")
                        {
                            
                        }
                
                    
                    
                    }
                }
            
            
            
            }
            
            
            
            
            
            
            
            
        }.ignoresSafeArea()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
