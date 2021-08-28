import UIKit


class CalculateMath {
    
    var fullEquation = "100+432*523-433/800"
    var valuesInEquation: [String] = []
    var operandsInEquation: [String] = []
    
    func parser()
    {
        var tempString = ""
    
            for char in fullEquation
        {
                if char.isNumber == true
                {
                    tempString += String(char)
                }
                else
                {
                    valuesInEquation.append(tempString)
                    operandsInEquation.append(String(char))
                    tempString = ""
                }
        }
        if !tempString.isEmpty
        {
            valuesInEquation.append(tempString)
        }
    }
}

var b = CalculateMath()

b.parser()
print(b.valuesInEquation)
print(b.operandsInEquation)

if let test = Int(b.valuesInEquation[1])
{
    print(test)
}


//print(Int(b.valuesInEquation[1])! * 2)
