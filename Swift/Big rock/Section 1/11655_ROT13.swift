//
//  11655_ROT13.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/05.
//

func asciiMaker(_ item: String) -> Int {
    return Int(exactly: Character(item).asciiValue!)!
}

func asciiMaker(_ item: Character) -> Int {
    return Int(exactly: item.asciiValue!)!
}

func stringMaker(_ item: Int) -> String {
    return String(UnicodeScalar(item)!)
}

let input = Array(readLine()!)
var result = ""

input.forEach { item in
    
    let asciiValue = asciiMaker(item)
    
    switch item {
    case "a" ... "z":
        if asciiValue + 13 > asciiMaker("z") {
            result += stringMaker(asciiValue - 13)
        } else {
            result += stringMaker(asciiValue + 13)
        }
    
    case "A" ... "Z":
        if asciiValue + 13 > asciiMaker("Z") {
            result += stringMaker(asciiValue - 13)
        } else {
            result += stringMaker(asciiValue + 13)
        }
    
    default: result += String(item)
    }
}

print(result)
