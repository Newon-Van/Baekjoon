//
//  Node&LinkedList.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/22.
//

import Foundation

class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    init() {
        
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    
    @discardableResult
    mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.value
    }
    
    @discardableResult
    mutating func remove(after node: Node<Value>) -> Value? {
        guard let node = copyNodes(returningCopyOf: node) else { return nil }
        
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    private mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {
        guard !isKnownUniquelyReferenced(&head) else {
            return nil
        }
        
        guard var oldNode = head else {
            return nil
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        var nodeCopy: Node<Value>?
        
        while let nextOldNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        
        return nodeCopy
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

extension LinkedList: Collection {
    var startIndex: Index {
        Index(node: head)
    }
    
    var endIndex: Index {
        Index(node: tail?.next)
    }
    
    func index(after i : Index) -> Index {
        Index(node: i.node?.next)
    }
    
    subscript(position: Index) -> Value {
        position.node!.value
    }
    
    struct Index: Comparable {
        var node: Node<Value>?
        
        static func == (lhs: Index, rhs: Index) -> Bool {
            switch(lhs.node, rhs.node) {
            case let (left?, right?): return left.next === right.next
            case (nil, nil) : return true
            default: return false
            }
        }
        
        static func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains{ $0 === rhs.node }
        }
    }
}

//example(of: "creating and linking nodes") {
//    let node1 = Node(value: 1)
//    let node2 = Node(value: 2)
//    let node3 = Node(value: 3)
//
//    node1.next = node2
//    node2.next = node3
//
//    print(node1)
//}

example(of: "using collection") {
//    var list = LinkedList<Int>()
//    list.append(1)
//    list.append(2)
//    list.append(3)
//
//    print(list)
    
//    var middleNode = list.node(at: 1)!
//    for _ in 1 ... 4 {
//        middleNode = list.insert(-1, after: middleNode)
//    }
//    print("After inserting: \(list)")
    
//    let poppedValue = list.pop()
//    print("After popping list : \(list)")
//    print("Popped Value : " + String(describing: poppedValue))
    
//    print("Before removing last node: \(list)")
//    let removedValue = list.removeLast()
//
//    print("After removing last node: \(list)")
//    print("Removed value: " + String(describing: removedValue))
    
//    print("Before removing at particular index: \(list)")
//    let index = 1
//    let node = list.node(at: index - 1)!
//    let removedValue = list.remove(after: node)
//
//    print("After removing at index \(index) : \(list)")
//    print("Revmoed value: " + String(describing: removedValue))
    
    var list = LinkedList<Int>()
    for i in 0 ... 9 {
        list.append(i)
    }
    
    print("List : \(list)")
    print("First element: \(list[list.startIndex])")
    
    print("Array containing first 3 elements : \(Array(list.prefix(3)))")
    print("Array containing last 3 elements : \(Array(list.suffix(3)))")
    
    let sum = list.reduce(0, +)
    print("Sum of all values: \(sum)")
}

public func example(of description: String, action: () -> Void) {
  print("---Example of \(description)---")
  action()
  print()
}




//
//
//import Foundation
//
//class Node<T> {
//    var value: T
//    var next: Node<T>?
//
//    init(value: T, next: Node<T>? = nil) {
//        self.value = value
//        self.next = next
//    }
//}
//
//struct LinkedList<T> {
//    var head: Node<T>?
//    var tail: Node<T>?
//    private var count: Int
//
//    var isEmpty : Bool {
//        return head == nil
//    }
//
//    var length : Int {
//        return count
//    }
//
//    init() {
//        count = 0
//    }
//
//    mutating func push(_ value: T) {
//        head = Node(value: value, next: head)
//        if tail == nil {
//            tail = head
//        }
//        count += 1
//    }
//
//    mutating func append(_ value: T) {
//        guard !isEmpty else {
//            push(value)
//            return
//        }
//
//        tail!.next = Node(value: value)
//        tail = tail!.next
//        count += 1
//    }
//
//    func find(at index: Int) -> Node<T>? {
//        var currentNode = head
//        var currentIndex = 0
//
//        while currentNode != nil && currentIndex < index {
//            currentNode = currentNode?.next
//            currentIndex += 1
//        }
//
//        return currentNode
//    }
//
//    @discardableResult
//    mutating func insert(_ value: T, after node: Node<T>) -> Node<T> {
//        guard tail !== node else {
//            append(value)
//            return tail!
//        }
//
//        node.next = Node(value: value, next: node.next)
//        count += 1
//        return node.next!
//    }
//
//    mutating func pop() -> T? {
//        defer {
//            head = head?.next
//            if isEmpty {
//                tail = nil
//            }
//            count -= 1
//        }
//        return head?.value
//    }
//
//    mutating func removeLast() -> T? {
//        guard let head = head else {
//            return nil
//        }
//        guard head.next != nil else {
//            return pop()
//        }
//
//        var prev = head
//        var current = head
//
//        while let next = current.next {
//            prev = current
//            current = next
//        }
//        prev.next = nil
//        tail = prev
//        count -= 1
//
//        return current.value
//    }
//
//    func middle() -> Node<T>? {
//        if length % 2 == 0 {
//            return find(at: (count / 2) - 1)
//        }
//        return find(at: count / 2)
//    }
//
//    mutating func reverse() {
//        tail = head
//
//        var prev = head
//        var current = head?.next
//
//        prev?.next = nil
//
//        while current != nil {
//            let next = current?.next
//            current?.next = prev
//            prev = current
//            current = next
//        }
//        head = prev
//
//    }
//}
//
//var list = LinkedList<Int>()
//list.push(5)
//list.push(4)
//list.push(3)
//list.push(2)
//list.push(1)
//
////while !list.isEmpty { print(list.removeLast()!) }
//
////print(list.middle()!.value)
//list.reverse()
//
//while !list.isEmpty { print(list.removeLast()!) }
