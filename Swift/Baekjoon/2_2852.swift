//
//  2_2852.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/06/19.
//

import Foundation

let N = Int(readLine()!)!
var firstTeam = 0
var secondTeam = 0
var lastTeam = 0
var goalTime = 0
var previous = 0

for _ in 0 ..< N {
    let input = readLine()!.split(separator: " ")
    let goal = input[1].split(separator: ":")
    goalTime = Int(goal[0])! * 60 + Int(goal[1])!
    
    if lastTeam < 0 {
        firstTeam += goalTime - previous
    } else if lastTeam > 0 {
        secondTeam += goalTime - previous
    }

    if input[0] == "1" {
        lastTeam -= 1
    } else {
        lastTeam += 1
    }
    
    previous = goalTime
}

if lastTeam < 0 {
    firstTeam += 48 * 60 - previous
} else if lastTeam > 0 {
    secondTeam += 48 * 60 - previous
}

var firstTeamMinute = String(firstTeam / 60)
var firstTeamSecond = String(firstTeam % 60)
var secondTeamMinute = String(secondTeam / 60)
var secondTeamSecond = String(secondTeam % 60)

if firstTeamMinute.count == 1{
    firstTeamMinute = "0" + firstTeamMinute
    
}
if firstTeamSecond.count == 1{
    firstTeamSecond = "0" + firstTeamSecond
}
if secondTeamMinute.count == 1{
    secondTeamMinute = "0" + secondTeamMinute
}
if secondTeamSecond.count == 1{
    secondTeamSecond = "0" + secondTeamSecond
}

print("\(firstTeamMinute):\(firstTeamSecond)")
print("\(secondTeamMinute):\(secondTeamSecond)")
