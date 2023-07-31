//
//  숨바꼭질5_실패.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/04/05.
//

import Foundation

//struct Queue<T> {
//    private var input = [T]()
//    private var output = [T]()
//
//    var count: Int {
//        input.count + output.count
//    }
//    var isEmpty: Bool {
//        input.isEmpty && output.isEmpty
//    }
//
//    mutating func enqueue(_ item: T) {
//        input.append(item)
//    }
//
//    mutating func dequeue() -> T {
//        if output.isEmpty {
//            output = input.reversed()
//            input.removeAll()
//        }
//        return output.removeLast()
//    }
//}
//
//struct Move {
//    var location: Int
//    var time: Int
//}
//
//struct Graph {
//    var odd: Int
//    var even: Int
//}
//
//
//func bfs() {
//    var subinQueue = Queue<Move>()
//    subinQueue.enqueue(Move(location: N, time: 1))
//
//    graph[N].odd = 0
//    graph[N].even = 0
//
//    while !subinQueue.isEmpty {
//        let subinNow = subinQueue.dequeue()
//
//        if subinNow.time != time {
//            time = subinNow.time
//        }
//
//        for subinNext in [
//            Move(location: subinNow.location + 1, time: subinNow.time + 1),
//            Move(location: subinNow.location - 1, time: subinNow.time + 1),
//            Move(location: subinNow.location * 2, time: subinNow.time + 1)
//        ] {
//            if subinNext.location < 0 || subinNext.location > 500000 {
//                continue
//            }
//
//            if time.isOdd() && graph[subinNext.location].odd != -1 && graph[subinNext.location].odd <= time {
//                continue
//            } else if time.isEven() && graph[subinNext.location].even != -1 && graph[subinNext.location].even <= time {
//                continue
//            }
//
//            subinQueue.enqueue(subinNext)
//
//            if time.isEven() {
//                graph[subinNext.location].even = time
//            } else {
//                graph[subinNext.location].odd = time
//            }
//        }
//    }
//}
//
//
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let (N, K) = (input[0], input[1])
//
//var graph = [Graph](repeating: Graph(odd: -1, even: -1), count: 500001)
//
//var time = 0
//
//
//if N == K {
//    print(time)
//} else {
//    bfs()
//
////    graph.enumerated().forEach { index, item in
////        print("\(index): \(item.odd), \(item.even)")
////    }
//
//
//    check()
//}
//
//func check() {
//    var sisterNow = K
//    var sisterTime = 0
//
//    while sisterNow < 500001 {
//        if sisterTime.isOdd() && graph[sisterNow].odd <= sisterTime {
//            print(sisterTime)
//            return
//        } else if sisterTime.isEven() && graph[sisterNow].even <= sisterTime {
//            print(sisterTime)
//            return
//        }
//
//        sisterTime += 1
//        sisterNow += sisterTime
//    }
//
//    print("-1")
//}
//
//extension Int {
//    func isEven() -> Bool {
//        return self % 2 == 1
//    }
//    func isOdd() -> Bool {
//        return self % 2 == 0
//    }
//}
