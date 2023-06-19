//
//  13300_방 배정.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/01.
//

import Foundation

enum Gender {
    case M
    case F
}

struct Node {
    var grade: Int
    var gender: Gender
}

let standard = readLine()!.split { $0 == " " }.map { Int($0)! }
let size = standard[1]
var testCase = standard[0]
var students = [Node]()
var result = 0

while testCase > 0 {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    students.append(Node(grade: input[1], gender: input[0] == 0 ? .F : .M))
    testCase -= 1
}

for i in 1 ... 6 {
    let mRoom = Int(ceil(Double(students.filter {
        $0.grade == i && $0.gender == .M
    }.count) / Double(size)))
    
    let fRoom = Int(ceil(Double(students.filter {
        $0.grade == i && $0.gender == .F
    }.count) / Double(size)))
    
    result += mRoom + fRoom
}

print(result)
