//
//  1213_팰린드롬 만들기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/11.
//

var input = readLine()!
var alphabetArray = [Int](repeating: 0, count: 26)
var result = ""
var oddCount = 0
var mid = Character(UnicodeScalar(0))

input.utf8.forEach { ascii in
    alphabetArray[Int(ascii) - Int(Character("A").asciiValue!)] += 1
}

for i in alphabetArray.indices.reversed() {
    if alphabetArray[i] % 2 == 1 {
        oddCount += 1
        mid = Character(UnicodeScalar(i + Int(Character("A").asciiValue!))!)
    }
    
    if oddCount > 1 {
        oddCount += 1
        break
    }
    
    for _ in 0 ..< alphabetArray[i] / 2 {
        result = String(UnicodeScalar(i + Int(Character("A").asciiValue!))!) + result
    }
    
    for _ in 0 ..< alphabetArray[i] / 2 {
        result += String(UnicodeScalar(i + Int(Character("A").asciiValue!))!)
    }
}

if oddCount >= 2 {
    print("I'm Sorry Hansoo")
} else if oddCount == 1 {
    result.insert(mid, at: result.index(result.startIndex, offsetBy: result.count / 2))
    print(result)
} else {
    print(result)
}
