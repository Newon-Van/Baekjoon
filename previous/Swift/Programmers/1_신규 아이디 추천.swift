//
//  1_신규 아이디 추천.swift
//  SwiftPractice
//
//  Created by Kim Yewon on 2022/07/03.
//

import Foundation

func solution(_ new_id:String) -> String {
    
    var id = new_id
    id = new_id.lowercased()
    
    var temp = ""
    for char in id {
        if (char >= "a" && char <= "z") || (char >= "0" && char <= "9") || char == "-" || char == "_" || char  == "." {
            temp += String(char)
        }
    }
    
    id = temp
    while id.contains("..") {
        id = id.replacingOccurrences(of: "..", with: ".")
    }
    
    while id.first == "." {
        id.removeFirst()
    }
    while id.last == "." {
        id.removeLast()
    }
    
    
    if id == "" {
        id += "a"
    }
    
    while id.count > 15 {
        id.removeLast()
    }
    
    while id.last == "." {
        id.removeLast()
    }
    
    while id.count < 3 {
        id += String(id.last!)
    }
    
    return id
}
