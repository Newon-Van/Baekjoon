//
//  Binary Search.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/18.
//

import Foundation

func binarySearch(arr: [Int], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = arr.count
    
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if arr[midIndex] == key {
            return midIndex
        } else if arr[midIndex] < key {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    
    return nil
}
