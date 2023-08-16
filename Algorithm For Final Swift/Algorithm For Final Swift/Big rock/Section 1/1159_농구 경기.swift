//
//  1159_농구 경기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/05.
//

let N = Int(readLine()!)!
var players = [Character:Int]()
var result = [Character]()

for _ in 1 ... N {
    let temp = readLine()!
    players[temp.first!] = (players[temp.first!] ?? 0) + 1
}

result = players.filter {
    $0.value >= 5
}.map { $0.key }.sorted()

if result.isEmpty {
    print("PREDAJA")
} else {
    result.forEach {
        print($0, terminator: "")
    }
}
