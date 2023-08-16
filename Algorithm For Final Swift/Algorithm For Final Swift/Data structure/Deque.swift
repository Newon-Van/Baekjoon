//
//  Deque.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/07/15.
//

import Foundation

struct Deque<T: Equatable> {
    var enqueue: [T]
    var dequeue = [T]()
    
    var count: Int {
        enqueue.count + dequeue.count
    }
    var isEmpty: Bool {
        enqueue.isEmpty && dequeue.isEmpty
    }
    var first: T? {
        return dequeue.isEmpty ? enqueue.first : dequeue.last
    }
    
    init(_ queue: [T]) {
        enqueue = queue
    }
    
    func enqueueFirst(_ node: T) {
        dequeue.append(node)
    }
    func enqueueLast(_ node: T) {
        enqueue.append(node)
    }
    
    func dequeueFirst() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.removeLast()
    }
    
    func dequeueLast() -> T? {
        if enqueue.isEmpty {
            (dequeue[0], dequeue[dequeue.lastIndex]) = (dequeue[dequeue.lastIndex], dequeue[0])
            return dequeue.removeLast()
        } else {
            return enqueue.removeLast()
        }
    }
}
