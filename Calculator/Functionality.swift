//
//  Functionality.swift
//  Calculator
//
//  Created by Daniel Guerrero on 8/23/21.
//

import Foundation
import SwiftUI

class CalculateMath {
    
    let text:String
    @Binding var finalAnswer:String
    
    init(text:String, finalAnswer:Binding<String>)
    {
        self.text = text
        _finalAnswer = finalAnswer
    }
    
    
    var valuesInEquation: [Double] = []
    var operandsInEquation: [String] = []
    
    func calculate()
    {
        var temp = 0.0
        //tuple, takes two doubles and returns one - defining function
        let order:[((String, (Double, Double) -> Double), (String, (Double, Double) -> Double))] = [(("*", *), ("/", /)), (("+", +), ("-", -))]
        print(order)
        for operand in order
        {
            var found = false
            repeat{
                found = false
            for op in operandsInEquation.enumerated()
            {
                if operand.0.0 == op.element
                {
                    print(operand.0.0, valuesInEquation[op.offset], valuesInEquation[op.offset+1])
                    //calling function - inputs from arrays
                    temp = operand.0.1(valuesInEquation[op.offset], valuesInEquation[op.offset+1])
                    valuesInEquation[op.offset] = temp
                    valuesInEquation.remove(at: op.offset+1)
                    operandsInEquation.remove(at: op.offset)
                    found = true
                    break
                }
                else if operand.1.0 == op.element
                {
                    print(operand.1.0, valuesInEquation[op.offset], valuesInEquation[op.offset+1])
                    //calling function - inputs from arrays
                    temp = operand.1.1(valuesInEquation[op.offset], valuesInEquation[op.offset+1])
                    valuesInEquation[op.offset] = temp
                    valuesInEquation.remove(at: op.offset+1)
                    operandsInEquation.remove(at: op.offset)
                    found = true
                    break
                }
            }
            }
            while found
        }
        
        finalAnswer = String(valuesInEquation.first!)

    }
    
    func parser()
    {
        var tempString = ""
    
            for char in text
        {
                if char.isNumber == true
                {
                    tempString += String(char)
                }
                else
                {
                    valuesInEquation.append(Double(tempString)!)
                    operandsInEquation.append(String(char))
                    tempString = ""
                }
        }
        if !tempString.isEmpty
        {
            valuesInEquation.append(Double(tempString)!)
        }
    }
    

    
    
    
    
    
}
