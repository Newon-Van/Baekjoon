//
//  map_filter.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/24.
//

import Foundation

struct TestScore {
    let korean: Int
    let english: Int
    let math : Int
}

struct Student{
    let name: String
    let score: Int
}

var arr = [TestScore](repeating: TestScore(korean: Int.random(in: 1...100), english: Int.random(in: 1...100), math: Int.random(in: 1...100)), count: 0)
for _ in 1 ... 5 {
    arr.append(TestScore(korean: Int.random(in: 1...100), english: Int.random(in: 1...100), math: Int.random(in: 1...100)))
}

var students = arr.enumerated().map{ (index: Int, score: TestScore) -> Student in
    Student(name: String(index), score: Int((Double(score.korean) + Double(score.english) + Double(score.math)) / 3))
}.filter { (student: Student) -> Bool in
    student.score >= 70
}

print(students)
