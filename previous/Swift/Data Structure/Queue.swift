//
//  Queue.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/07/10.
//

import Foundation

public class Node<T> {
  
  public var value: T
  public var next: Node<T>?
  public var previous: Node<T>?
  
  public init(value: T) {
    self.value = value
  }
}

extension Node: CustomStringConvertible {
  
  public var description: String {
    String(describing: value)
  }
}

public class DoublyLinkedList<T> {
  
  private var head: Node<T>?
  private var tail: Node<T>?
  
  public init() { }
  
  public var isEmpty: Bool {
    head == nil
  }
  
  public var first: Node<T>? {
    head
  }
  
  public func append(_ value: T) {
    let newNode = Node(value: value)
    
    guard let tailNode = tail else {
      head = newNode
      tail = newNode
      return
    }
    
    newNode.previous = tailNode
    tailNode.next = newNode
    tail = newNode
  }
  
  public func remove(_ node: Node<T>) -> T {
    let prev = node.previous
    let next = node.next
    
    if let prev = prev {
      prev.next = next
    } else {
      head = next
    }
    
    next?.previous = prev
    
    if next == nil {
      tail = prev
    }
    
    node.previous = nil
    node.next = nil
    
    return node.value
  }
}

extension DoublyLinkedList: CustomStringConvertible {
  
  public var description: String {
    var string = ""
    var current = head
    while let node = current {
      string.append("\(node.value) -> ")
      current = node.next
    }
    return string + "end"
  }
}

public class LinkedListIterator<T>: IteratorProtocol {
  
  private var current: Node<T>?
  
  init(node: Node<T>?) {
    current = node
  }
  
  public func next() -> Node<T>? {
    defer { current = current?.next }
    return current
  }
}

extension DoublyLinkedList: Sequence {
  
  public func makeIterator() -> LinkedListIterator<T> {
    LinkedListIterator(node: head)
  }
}

protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

 MARK: - QueueArray

struct QueueArray<T> : Queue {
    var array: [T] = []
    init() {}

    var isEmpty: Bool {
        array.isEmpty
    }
    var peek: T? {
        array.first
    }

    mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }

    mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    var description: String{
        String(describing: array)
    }
}

var queue = QueueArray<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
print(queue)
queue.dequeue()
print(queue)
print(queue.peek)

 MARK: - QueueDoublyLinkedList

class QueueLinkedList<T> : Queue {
    private var list = DoublyLinkedList<T>()
    init() {}

    func enqueue(_ element: Element) -> Bool {
        list.append(element)
        return true
    }

    func dequeue() -> Element? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return list.remove(element)
    }

    var peek: T? {
        list.first?.value
    }

    var isEmpty: Bool {
        list.isEmpty
    }
}



// MARK : - Double Stack Queue

struct QueueStack<T>: Queue {
    var input: [T] = []
    var output: [T] = []
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    var peek: T? {
        !input.isEmpty ? input.last : output.first
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        input.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}
