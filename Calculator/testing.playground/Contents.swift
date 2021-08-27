import UIKit

class CalculateMath {
    
    //var fullEquation = "100+432*523-433/800.0"
    var valuesInEquation: [Double] = [100, 200, 300, 400, 500]
    var operandsInEquation: [String] = ["/", "-", "+", "*"]
    
    func test()
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






    }
}

var b = CalculateMath()

b.test()
print(b.valuesInEquation.first)

/*
 
switch op.element
{
case "*":
    temp = valuesInEquation[op.offset] * valuesInEquation[op.offset+1]
    valuesInEquation[op.offset] = temp
    valuesInEquation.remove(at: op.offset+1)
    operandsInEquation.remove(at: op.offset)
case "/":
    temp = valuesInEquation[op.offset] / valuesInEquation[op.offset+1]
    valuesInEquation[op.offset] = temp
    valuesInEquation.remove(at: op.offset+1)
    operandsInEquation.remove(at: op.offset)
case "-":
    temp = valuesInEquation[op.offset] - valuesInEquation[op.offset+1]
    valuesInEquation[op.offset] = temp
    valuesInEquation.remove(at: op.offset+1)
    operandsInEquation.remove(at: op.offset)
case "+":
    temp = valuesInEquation[op.offset] + valuesInEquation[op.offset+1]
    valuesInEquation[op.offset] = temp
    valuesInEquation.remove(at: op.offset+1)
    operandsInEquation.remove(at: op.offset)
default:
    break
}
*/
