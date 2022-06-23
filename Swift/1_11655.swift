//
//  1_11655.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/14.
//

let input = Array(readLine()!)
var result = ""

for i in input {
    if i.asciiValue! >= Character("A").asciiValue! && i.asciiValue! <= Character("Z").asciiValue! {
        var temp = i.asciiValue! + 13
        
        if temp <= Character("Z").asciiValue! {
            result += String(UnicodeScalar(temp))
        } else {
            result += String(UnicodeScalar(temp - 26))
        }
    }
    else if i.asciiValue! >= Character("a").asciiValue! && i.asciiValue! <= Character("z").asciiValue! {
        var temp = i.asciiValue! + 13
        
        if temp <= Character("z").asciiValue! {
            result += String(UnicodeScalar(temp))
        } else {
            result += String(UnicodeScalar(temp - 26))
        }
    }
    else {
        result += String(i)
    }
}

print(result)
