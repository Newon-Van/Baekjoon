//
//  problem_2.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/06/15.
//

import Foundation

// https://blog.naver.com/boostcamp_official/223085597916

let inputs = readLine()!.split { $0 == " " }

var result = [String]()
var temp = ""

func paddingInputer() {
    while temp.count < 8 {
        temp += "."
    }
    result.append(temp)
}

for input in inputs {
    
    switch input {
    case "BOOL":
        if temp.count <= 7 {
            temp += "#"
        } else {
            paddingInputer()
            temp = "#"
        }
    case "SHORT":
        if temp.count <= 5 && !temp.isEmpty {
            while temp.count % 2 != 0 {
                temp += "."
            }
            temp += "##"
        } else if temp.isEmpty {
            temp += "##"
        } else {
            paddingInputer()
            temp = "##"
        }
    case "FLOAT":
        if temp.count <= 3 && !temp.isEmpty {
            while temp.count % 4 != 0 {
                temp += "."
            }
            temp += "####"
        } else if temp.isEmpty {
            temp = "####"
        } else {
            paddingInputer()
            temp = "####"
        }
    case "INT":
        if !temp.isEmpty {
            paddingInputer()
            temp = ""
        }
        result.append("########")
    case "LONG":
        if !temp.isEmpty {
            paddingInputer()
            temp = ""
        }
        result.append("########"); result.append("########")
    default: break
    }
    
    print(input, temp, result)
    
    if result.count > 8 {
        break
    }
}

if !temp.isEmpty {
    while temp.count < 8 {
        temp += "."
    }
    result.append(temp)
}

if result.count > 8 {
    print("HALT")
} else {
    result.forEach {
        print($0 + ",",terminator: "")
    }
}
