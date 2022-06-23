//
//  2_1068.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/22.
//

import Foundation

class Node<T> {
    let value: T
    var parent: Node?
    var children = [Node]()
    
    init(value: T) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

extension Node where T: Equatable {
    func searchLeaf(deleteNode: T) -> Int {
        if self.value == deleteNode {
            if self.parent?.children.count == 1 {
                return 1
            }
            else {
                return 0
            }
        }
        if self.children.count == 0 {
            return 1
        }
        
        var count = 0
        for child in children {
            count += child.searchLeaf(deleteNode: deleteNode)
        }
        
        return count
    }
}

let N = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let deleteNode = Int(readLine()!)!
var arr = [Node<Int>]()

for i in 0 ... 50 {
    arr.append(Node(value: i))
}

var rootNode = [Int]()


input.enumerated().forEach{ index, value in
    if value == -1 {
        arr[index].parent = nil
        rootNode.append(index)
    } else {
        arr[index].parent = arr[value]
        arr[value].add(child: arr[index])
    }
}

var count = 0
rootNode.forEach{ rootIndex in
    count += arr[rootIndex].searchLeaf(deleteNode: deleteNode)
}

print(count)
