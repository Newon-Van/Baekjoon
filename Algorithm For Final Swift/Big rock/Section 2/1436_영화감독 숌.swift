//
//  1436_영화감독 숌.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/02/14.
//

let N = Int(readLine()!)!
var now = 0
var result = "666"

for number in 666 ... Int.max {
    
    if now == N {
        print(result)
        break
    }
    
    let input = String(number)
    var last = Character("a")
    var sixCounter = 0
    
    for ch in input {
        if last == "6" && ch == "6" {
            sixCounter += 1
        } else {
            sixCounter = 0
        }
        
        if sixCounter == 2 {
            now += 1
            result = input
            break
        }
        
        last = ch
    }
}
