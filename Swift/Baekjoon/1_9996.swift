//
//  1_9996.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/14.
//

import Foundation

let N = Int(readLine()!)!
let standard = readLine()!

let delimeter = standard.firstIndex(of: "*")!
let pre = standard.prefix(upTo: delimeter)
let suf = standard.suffix(from: delimeter).dropFirst()

for _ in 1...N {
    let temp = readLine()!
    
    if pre.count + suf.count > temp.count {
        print("NE")
    }
    else if temp.hasPrefix(pre) && temp.hasSuffix(suf) {
        print("DA")
    } else {
        print("NE")
    }
}
