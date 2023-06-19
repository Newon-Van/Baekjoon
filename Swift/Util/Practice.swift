//
//  Practice.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/23.
//

import Foundation

struct Heap2<T> {
    var elements = [T]()
    let priorityFunction: (T, T) -> Bool
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    var count: Int {
        elements.count
    }
    
    func peek() -> T? {
        elements.first
    }
    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    func leftChildIndex(_ index: Int) -> Int {
        return (index * 2) + 1
    }
    func rightChildIndex(_ index: Int) -> Int {
        return (index * 2) + 2
    }
    func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
}
