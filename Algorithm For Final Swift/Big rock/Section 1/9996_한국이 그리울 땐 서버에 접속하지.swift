//
//  9996_한국이 그리울 땐 서버에 접속하지.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/05.
//

let N = Int(readLine()!)!
let standard = readLine()!
let standardPrefix = standard.split(separator: "*")[0]
let standardSuffix = standard.split(separator: "*")[1]

for _ in 0 ..< N {
    let temp = readLine()!
    
    switch temp {
    case temp where standardPrefix.count + standardSuffix.count > temp.count: print("NE")
    case temp where temp.hasPrefix(standardPrefix) && temp.hasSuffix(standardSuffix): print("DA")
    default: print("NE")
    }
}
