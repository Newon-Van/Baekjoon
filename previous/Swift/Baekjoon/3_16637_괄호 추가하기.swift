//
//  3_16637_괄호 추가하기.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/30.
//

import Foundation

func operation(oper:String, a: Int, b: Int) -> Int {
    if oper == "+" {
        return a + b
    } else if oper == "-" {
        return a - b
    } else {
        return a * b
    }
}

func go(index: Int, now: Int){
    if index == numberList.count - 1 {
        result = max(result, now)
        return
    }
    
    go(index: index + 1, now: operation(oper: operList[index], a: now, b: numberList[index + 1]))
    
    if index + 2 < numberList.count {
        let temp = operation(oper: operList[index + 1], a: numberList[index + 1], b: numberList[index + 2])
        go(index: index + 2, now: operation(oper: operList[index], a: now, b: temp))
    }
}

let N = Int(readLine()!)!
let input = Array(readLine()!.map{ String($0) })
var numberList = [Int]()
var operList = [String]()
var result = Int.min

for i in 0 ..< input.count {
    if i % 2 == 0 {
        numberList.append(Int(input[i])!)
    } else {
        operList.append(input[i])
    }
}

go(index: 0, now: numberList[0])
print(result)
