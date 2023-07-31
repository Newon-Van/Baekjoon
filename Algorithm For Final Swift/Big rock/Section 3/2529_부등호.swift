//
//  2529_부등호.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/04/05.
//

func checker(pre: Int, suf: Int, oper: String) -> Bool {
    if oper == "<" {
        return pre < suf
    } else {
        return pre > suf
    }
}

func backTracking(now: String) {
    if now.count - 1 == N {
        if result.count < 2 {
            result.append(now)
        } else {
            result.removeLast()
            result.append(now)
        }
        
        return
    }
    
    for i in 0 ... 9 {
        let temp = digits
        let currentDigit = 1 << i
        
        guard digits & currentDigit == 0 else { continue }
        
        if now.isEmpty {
            digits = digits | currentDigit
            backTracking(now: now + String(i))
            digits = temp
        } else if checker(pre: Int(now.suffix(1))!, suf: i, oper: inequality[now.count - 1]) {
            digits = digits | currentDigit
            backTracking(now: now + String(i))
            digits = temp
        }
    }
}



let N = Int(readLine()!)!
var inequality = readLine()!.split(separator: " ").map { String($0) }
var result = [String]()

var digits = 0
backTracking(now: "")

print(result[1])
print(result[0])
