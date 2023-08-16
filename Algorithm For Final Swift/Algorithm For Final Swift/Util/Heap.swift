//
//  File.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/05/18.
//

import Foundation

struct Heap<T> {
    var elements: [T]
    let priorityFunction: (T, T) -> Bool
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    var count: Int {
        return elements.count
    }
    
    init(elements: [T], priorityFunction: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
    
    func peek() -> T? {
        return elements.first
    }
    
    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    //MARK: - priority
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else { return parentIndex }
        return childIndex
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    mutating func swapElemet(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else { return }
        elements.swapAt(firstIndex, secondIndex)
    }
    
    //MARK: - enqueue
    mutating func enqueue(_ element: T) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }
    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index), isHigherPriority(at: index, than: parent) else { return }
        swapElemet(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }
    
    //MARK: - dequeue
    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        swapElemet(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        return element
    }
    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex { return }
        swapElemet(at: index, with: childIndex)
        siftDown(elementAtIndex: childIndex)
    }
}
