import Foundation

let input = Array(readLine()!)
let target = Array(readLine()!)

var inputIndex = 0
var flagIndex = 0
var checkingIndex = 0

var result = 0


while inputIndex < input.count {
    
    if input[inputIndex] == target[checkingIndex] {
        if checkingIndex == 0 {
            flagIndex = inputIndex
        }
        
        checkingIndex += 1
        
        if checkingIndex == target.count {
            flagIndex = inputIndex + 1
            
            result += 1
            checkingIndex = 0
        }
    } else {
        inputIndex = flagIndex
        flagIndex += 1
        checkingIndex = 0
    }
    
    inputIndex += 1
}

print(result)
