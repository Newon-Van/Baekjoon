//
//  LinkedList_50%.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/07/06.
//

//import Foundation
//
//class Node<Value> {
//    var value: Value
//    var next: Node?
//
//    init(value: Value, next: Node? = nil) {
//        self.value = value
//        self.next = next
//    }
//}
//
//extension Node: CustomStringConvertible {
//    var description: String {
//        guard let next = next else {
//            return "\(value)"
//        }
//        return "\(value) -> " + String(describing: next) + " "
//    }
//}
//
//struct LinkedList<Value> {
//    var head: Node<Value>?
//    var tail: Node<Value>?
//
//    init() {
//
//    }
//
//    var isEmpty: Bool {
//        head == nil
//    }
//
//    mutating func push(_ value: Value) {
//        head = Node(value: value, next: head)
//        if tail == nil {
//            tail = head
//        }
//    }
//
//    mutating func append(_ value: Value) {
//        guard !isEmpty else {
//            push(value)
//            return
//        }
//
//        tail!.next = Node(value: value)
//        tail = tail!.next
//    }
//
//    func node(at index: Int) -> Node<Value>? {
//        var currentNode = head
//        var currentIndex = 0
//
//        while currentNode != nil && currentIndex < index {
//            currentNode = currentNode!.next
//            currentIndex += 1
//        }
//
//        return currentNode
//    }
//
//    @discardableResult
//    mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
//        guard tail !== node else {
//            append(value)
//            return tail!
//        }
//
//        node.next = Node(value: value, next: node.next)
//        return node.next!
//    }
//
//
//    @discardableResult
//    mutating func pop() -> Value? {
//        defer {
//            head = head?.next
//            if isEmpty {
//                tail = nil
//            }
//        }
//        return head?.value
//    }
//
//    @discardableResult
//    mutating func removeLast() -> Value? {
//        guard let head = head else {
//            return nil
//        }
//        guard head.next != nil else {
//            return pop()
//        }
//        var prev = head
//        var current = head
//
//        while let next = current.next {
//            prev = current
//            current = next
//        }
//        prev.next = nil
//        tail = prev
//        return current.value
//    }
//
//    @discardableResult
//    mutating func remove(after node: Node<Value>) -> Value? {
//        defer {
//            if node.next === tail {
//                tail = node
//            }
//            node.next = node.next?.next
//        }
//        return node.next?.value
//    }
//}
//
//extension LinkedList: CustomStringConvertible {
//    var description: String {
//        guard let head = head else {
//            return "Empty List"
//        }
//        return String(describing: head)
//    }
//}
//
////example(of: "creating and linking nodes") {
////    let node1 = Node(value: 1)
////    let node2 = Node(value: 2)
////    let node3 = Node(value: 3)
////
////    node1.next = node2
////    node2.next = node3
////
////    print(node1)
////}
//
//example(of: "append") {
//    var list = LinkedList<Int>()
//    list.append(1)
//    list.append(2)
//    list.append(3)
//
//    print(list)
//
////    var middleNode = list.node(at: 1)!
////    for _ in 1 ... 4 {
////        middleNode = list.insert(-1, after: middleNode)
////    }
////    print("After inserting: \(list)")
//
////    let poppedValue = list.pop()
////    print("After popping list : \(list)")
////    print("Popped Value : " + String(describing: poppedValue))
//
////    print("Before removing last node: \(list)")
////    let removedValue = list.removeLast()
////
////    print("After removing last node: \(list)")
////    print("Removed value: " + String(describing: removedValue))
//
//    print("Before removing at particular index: \(list)")
//    let index = 1
//    let node = list.node(at: index - 1)!
//    let removedValue = list.remove(after: node)
//
//    print("After removing at index \(index) : \(list)")
//    print("Revmoed value: " + String(describing: removedValue))
//}
//
//public func example(of description: String, action: () -> Void) {
//  print("---Example of \(description)---")
//  action()
//  print()
//}
