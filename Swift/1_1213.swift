//
//  1_1213.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/14.
//

import Foundation

let input = Array(readLine()!)
var alphabet = [Int](repeating: 0, count: 26)
var oddCounter = 0
var result = ""
var mid = ""

for i in input {
    let index = Int(i.asciiValue! - Character("A").asciiValue!)
    alphabet[index] += 1
}

for i in alphabet.indices.reversed() {
    if alphabet[i] % 2 == 1 {
        oddCounter += 1
        mid = String(Character(UnicodeScalar(i + Int(Character("A").asciiValue!))!))
    }
    if oddCounter > 1 {
        print("I'm Sorry Hansoo")
        break
    }
    
    if alphabet[i] != 0 {
        var temp = ""
        for _ in 0 ..< (alphabet[i] / 2) {
            temp += String(UnicodeScalar(i + Int(Character("A").asciiValue!))!)
        }
        result = temp + result
        for _ in 0 ..< (alphabet[i] / 2) {
            result += String(UnicodeScalar(i + Int(Character("A").asciiValue!))!)
        }
    }
}

if oddCounter == 1 {
    result.insert(Character(mid), at: result.index(result.startIndex, offsetBy: result.count / 2))
    print(result)
} else if oddCounter == 0{
    print(result)
}
