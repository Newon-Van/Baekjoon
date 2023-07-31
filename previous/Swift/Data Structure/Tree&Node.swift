//
//  Tree&Node.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/22.
//


struct Queue<T> {
    var input = [T]()
    var output = [T]()
    
    var isEmpty : Bool {
        return input.isEmpty && output.isEmpty
    }
    var count : Int {
        return input.count + output.count
    }
    var peek : T? {
        return input.first
    }
    
    mutating func enqueue(_ element: T) {
        input.append(element)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        if output.isEmpty {
            return nil
        }
        return output.removeLast()
        
    }
}


class Node<T> {
    var value: T
    var parent: Node?
    var children = [Node]()
    
    init (value: T){
        self.value = value
    }
    
    func add (child: Node) {
        children.append(child)
        child.parent = self
    }
}

extension Node where T: Equatable {
    func search(value: T) -> Node? {
        if value == self.value {
            return self
        }
        
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        
        return nil
    }
    
    func forEachDepthFirst(visit: (Node) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
    
    func forEachLevelOrder(visit: (Node) -> Void) {
        visit(self)
        var queue = Queue<Node>()
        children.forEach { queue.enqueue($0) }
        
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach{ queue.enqueue($0) }
        }
    }
    
    func search(_ value: T) -> Node? {
        var result: Node?
        forEachLevelOrder { node in
            if node.value == value {
                return result = node
            }
        }
        return result
    }
}


let beverages = Node(value: "beverages")
let hotBeverages = Node(value: "hot")
let coldBeverages = Node(value: "cold")

let tea = Node(value: "tea")
let black = Node(value: "black")
let green = Node(value: "green")
let chai = Node(value: "chai")

let coffe = Node(value: "coffee")

let cocoa = Node(value: "cocoa")

beverages.add(child: hotBeverages)
beverages.add(child: coldBeverages)

hotBeverages.add(child: tea)
tea.add(child: black)
tea.add(child: green)
tea.add(child: chai)

hotBeverages.add(child: coffe)
hotBeverages.add(child: cocoa)

let soda = Node(value: "soda")
let gingerAle = Node(value: "ginger ale")
let bitterLemon = Node(value:"bitter lemon")

let milk = Node(value: "milk")

coldBeverages.add(child: soda)
soda.add(child: gingerAle)
soda.add(child: bitterLemon)

coldBeverages.add(child: milk)

// depth first
//beverages.forEachDepthFirst{ print($0.value) }

// level first
beverages.forEachLevelOrder{ print($0.value) }
