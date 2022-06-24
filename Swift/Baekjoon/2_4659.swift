//
//  2_4659.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/17.
//

import Foundation

var input = readLine()!
let vowel = ["a", "e", "i", "o", "u"]

func vowelChecker(input: String) -> Bool {
    return input.contains("a") || input.contains("e") || input.contains("i") || input.contains("o") || input.contains("u")
}

while input != "end" {
    var result = "<\(input)> is acceptable."

    if !vowelChecker(input: input) {
        result = "<\(input)> is not acceptable."
    }
    else if input.count == 2 {
        let temp = String(Array(input)[0]) + String(Array(input)[1])
        if input.first == input.last && (temp != "ee" && temp != "oo") {
            result = "<\(input)> is not acceptable."
        }
    } else if input.count > 2 {
        for i in 2 ..< Array(input).count {
            if vowel.contains(String(Array(input)[i])) && vowel.contains(String(Array(input)[i - 1])) && vowel.contains(String(Array(input)[i - 2])) {
                result = "<\(input)> is not acceptable."
            } else if !vowel.contains(String(Array(input)[i])) && !vowel.contains(String(Array(input)[i - 1])) && !vowel.contains(String(Array(input)[i - 2])) {
                result = "<\(input)> is not acceptable."
            }
        }
        for i in 1 ..< Array(input).count {
            let temp = String(Array(input)[i - 1]) + String(Array(input)[i])
            if Array(input)[i] == Array(input)[i - 1] && (temp != "ee" && temp != "oo") {
                result = "<\(input)> is not acceptable."
            }
        }
    }
    
    print(result)
    input = readLine()!
}
