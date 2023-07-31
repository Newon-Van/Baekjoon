//
//  3190_뱀.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/07/16.
//

import Foundation

struct Deque<T: Equatable> {
    private var enqueue = [T]()
    private var dequeue = [T]()
    
    var count: Int {
        enqueue.count + dequeue.count
    }
    var isEmpty: Bool {
        enqueue.isEmpty && dequeue.isEmpty
    }
    var first: T? {
        return dequeue.isEmpty ? enqueue.first : dequeue.last
    }
    var last: T? {
        return enqueue.isEmpty ? dequeue.first : enqueue.last
    }
    
    init(_ queue: [T]) {
        enqueue = queue
    }
    
    mutating func enqueueFirst(_ node: T) {
        dequeue.append(node)
    }
    mutating func enqueueLast(_ node: T) {
        enqueue.append(node)
    }
    
    @discardableResult
    mutating func dequeueFirst() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.removeLast()
    }
    
    @discardableResult
    mutating func dequeueLast() -> T? {
        if enqueue.isEmpty {
            enqueue = dequeue.reversed()
            dequeue.removeAll()
        }
        return enqueue.removeLast()
    }
    
    func contains(_ node: T) -> Bool {
        return enqueue.contains(node) || dequeue.contains(node)
    }
}

struct Coordinate: Equatable {
    var y: Int
    var x: Int
}
struct MoveList {
    var time: Int
    var move: String
}



func move() -> Bool {
    
    guard var snapeHeadMove = snape.last else { return false }
    
    switch snapeHead {
    case "L":
        guard 0 <= snapeHeadMove.x - 1 else { return false }
        snapeHeadMove.x -= 1
        guard !snape.contains(Coordinate(y: snapeHeadMove.y, x: snapeHeadMove.x)) else { return false }
        
        snape.enqueueLast(snapeHeadMove)
        
        board[snapeHeadMove.y][snapeHeadMove.x] == 0 ? { snape.dequeueFirst() }() : { board[snapeHeadMove.y][snapeHeadMove.x] = 0 }()
    case "R":
        guard snapeHeadMove.x + 1 < n else { return false }
        snapeHeadMove.x += 1
        guard !snape.contains(Coordinate(y: snapeHeadMove.y, x: snapeHeadMove.x)) else { return false }
        
        snape.enqueueLast(snapeHeadMove)
        
        board[snapeHeadMove.y][snapeHeadMove.x] == 0 ? { snape.dequeueFirst() }() : { board[snapeHeadMove.y][snapeHeadMove.x] = 0 }()
    case "N":
        guard 0 <= snapeHeadMove.y - 1 else { return false }
        snapeHeadMove.y -= 1
        guard !snape.contains(Coordinate(y: snapeHeadMove.y, x: snapeHeadMove.x)) else { return false }
        
        snape.enqueueLast(snapeHeadMove)
        
        board[snapeHeadMove.y][snapeHeadMove.x] == 0 ? { snape.dequeueFirst() }() : { board[snapeHeadMove.y][snapeHeadMove.x] = 0 }()
    case "S":
        guard snapeHeadMove.y + 1 < n else { return false }
        snapeHeadMove.y += 1
        guard !snape.contains(Coordinate(y: snapeHeadMove.y, x: snapeHeadMove.x)) else { return false }
        
        snape.enqueueLast(snapeHeadMove)
        
        board[snapeHeadMove.y][snapeHeadMove.x] == 0 ? { snape.dequeueFirst() }() : { board[snapeHeadMove.y][snapeHeadMove.x] = 0 }()
    default: break
    }
    
    return true
}

let n = Int(readLine()!)!
var board = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var moveList = [MoveList]()
var time = 1
var snape = Deque<Coordinate>([Coordinate(y: 0, x: 0)])
var snapeHead = "R"


let appleCount = Int(readLine()!)!
for _ in 0 ..< appleCount {
    let apple = readLine()!.split { $0 == " " }.map { Int($0)! }
    board[apple[0] - 1][apple[1] - 1] = 1
}

let changeCount = Int(readLine()!)!
for _ in 0 ..< changeCount {
    let raw = readLine()!.split { $0 == " " }
    moveList.append(MoveList(time: Int(raw[0])!, move: String(raw[1])))
}
moveList = moveList.reversed()

while move() {
    
    if let moveAction = moveList.last, moveAction.time == time {
        
        switch moveAction.move {
        case "L":
            
            switch snapeHead {
            case "L": snapeHead = "S"
            case "R": snapeHead = "N"
            case "N": snapeHead = "L"
            case "S": snapeHead = "R"
            default: break
            }
            
        case "D":
            
            switch snapeHead {
            case "L": snapeHead = "N"
            case "R": snapeHead = "S"
            case "N": snapeHead = "R"
            case "S": snapeHead = "L"
            default: break
            }
            
        default: break
        }
        
        moveList.removeLast()
    }
    
    time += 1
}

print(time)
