//
//  1_1159.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/14.
//

import Foundation

let N = Int(readLine()!)!
var players = [Int](repeating: 0, count: 26)
var result = ""

for _ in 1...N {
    players[Int(readLine()!.first!.asciiValue!) - Int(("a" as Character).asciiValue!)] += 1
}

for i in players.indices {
    if (players[i] >= 5) {
        result += String(Character(UnicodeScalar(Int(("a" as Character).asciiValue!) + i)!))
    }
}

if result == "" {
    print("PREDAJA")
} else {
    print(result)
}


// ---------------------------------

import Foundation

let N = Int(readLine()!)!
var players = [Character:Int]()
var result = [Character]()
for _ in 1 ... N {
    let input = readLine()!
    players[input.first!] = (players[input.first!] ?? 0) + 1
}

result = players.filter{ player in
    player.value >= 5
}.map{ $0.key }.sorted()

if result.isEmpty {
    print("PREDAJA")
} else {
    result.forEach{
        print($0, terminator: "")
    }
}
