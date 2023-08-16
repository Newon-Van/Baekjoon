//
//  Linked List.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/03.
//

import Foundation

public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    /*
     Note: To avoid ownership cycles, we declare the previous pointer to be weak. If you have a node A that is followed by node B in the list, then A points to B but also B points to A. In certain circumstances, this ownership cycle can cause nodes to be kept alive even after you deleted them. We don't want that, so we make one of the pointers weak to break the cycle.

     */
    
    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        guard var node = head else { return nil }
        
        while let next = node.next { node = next }
        return node
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    public func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            // 내가 헤드야?
            head = next
        }
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
    public var count: Int {
        guard var node = head else { return 0 }
        
        var count = 1
        
        while let next = node.next {
            node = next
            count += 1
        }
        
        return count
        /*
         One way to speed up count from O(n) to O(1) is to keep track of a variable that counts how many nodes are in the list. Whenever you add or remove a node, you also update this variable.
         */
    }
    
    public func node(atIndex index: Int) -> Node {
        if index == 0 { return head! }
        else {
            var node = head!.next
            for _ in 1 ..< indexc {
                node = node?.next
                if node == nil { break }
            }
        }
        
        return node!
    }
    
    public subscript(index: Int) -> T {
        let node = node(atIndex: index)
        return node.value
    }
    
    public func insert(_ node: Node, atIndex index: Int) {
        let newNode = node
        
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = self.node(atIndex: index - 1)
            let next = prev.next
            
            newNode.previous = prev
            newNode.next = prev.next
            prev.next = newNode
            next?.previous = newNode
        }
    }
    
    public func removeAll() {
        head = nil
    }
    
    
}

let list = LinkedList<String>()
list.isEmpty
list.first

list.append(value: "Hello")
list.isEmpty
list.first!.value
list.last!.value
