//
//  1_2559.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/14.
//

import Foundation

var input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let N = input[0], K = input[1]
var psum = [Int](repeating: 0, count: N + 1), result = -10000000

let temperature = readLine()!.components(separatedBy: " ").map{ Int(String($0))! }
for i in 1 ... temperature.count {
    psum[i] = psum[i - 1] + temperature[i - 1]
}

for i in 0 ..< psum.count - K {
    result = max(result, psum[K + i] - psum[i])
}

print(result)
