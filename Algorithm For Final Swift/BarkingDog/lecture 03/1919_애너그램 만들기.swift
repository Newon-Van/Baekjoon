//
//  1919_애너그램 만들기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/01.
//

import Foundation

var a = Array(readLine()!)
var b = Array(readLine()!)
var count = 0

if a.count > b.count { swap(&a, &b) }
for i in 0 ..< a.count {
    for j in 0 ..< b.count {
        if a[i] == b[j] {
            b[j] = "-"
            count += 1
            break
        }
    }
}
print(a.count + b.count - 2 * count)
