//
//  2910_빈도 정렬.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/02/01.
//

struct Count {
    var time: Int
    let order: Int
}

let standard = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, C) = (standard[0], standard[1])

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var sorting = [Int:Count]()

input.forEach {
    if sorting.keys.contains($0) {
        sorting[$0]!.time += 1
    } else {
        sorting[$0] = Count(time: 1, order: sorting.keys.count + 1)
    }
}

sorting.sorted {
    $0.value.time == $1.value.time ? $0.value.order < $1.value.order : $0.value.time > $1.value.time
}.forEach {
    for _ in 0 ..< $0.value.time {
        print($0.key, terminator: " ")
    }
}
