//
//  3986_좋은 단어.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/12.
//

var N = Int(readLine()!)!
var result = 0

repeat {
    let words = readLine()!
    var stack = [Character]()
    
    words.forEach { word in
        if stack.last == word {
            stack.removeLast()
        } else {
            stack.append(word)
        }
    }
    
    if stack.isEmpty {
        result += 1
    }
    
    N -= 1
} while N > 0

print(result)

//MARK: - Another way

let n = Int(readLine()!)!
var result = 0

for _ in 0 ..< n {
    let input = readLine()!
    var stack = [Character]()
    
    input.forEach { item in
        if stack.last == item {
            stack.removeLast()
        } else {
            stack.append(item)
        }
    }
    
    if stack.isEmpty {
        result += 1
    }
}

print(result)

