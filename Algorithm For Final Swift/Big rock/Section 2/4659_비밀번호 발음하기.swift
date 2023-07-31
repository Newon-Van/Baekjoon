//
//  4659_비밀번호 발음하기.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/02/01.
//

let vowel = ["a", "e", "i", "o", "u"]

func firstOption(_ now: String) -> Bool {
    if vowel.contains(now) {
        return true
    }
    return false
}

func secondOption(_ now: String, _ isLastVowel: inout Bool, _ counter: inout Int) -> Bool {
    var result = true
    
    if vowel.contains(String(now)) && isLastVowel {
        counter += 1
    } else if !vowel.contains(String(now)) && !isLastVowel {
        counter += 1
    } else {
        counter = 1
        isLastVowel.toggle()
    }
    
    if counter >= 3 {
        result = false
    }
    
    return result
}

func thirdOption(_ now: String, _ lastWord: inout String) -> Bool {
    if lastWord == String(now) && (lastWord != "e" && lastWord != "o") {
        return false
    }
    
    lastWord = now
    
    return true
}

while let input = readLine() {
    
    if input == "end" {
        break
    }
    
    var isVowelExist = false
    var isLastVowel = false
    var sameVowelCounter = 0
    
    var lastWord = ""
    
    var isPossiblePassword = false
    
    
    for i in input {
        if !isVowelExist {
            isVowelExist = firstOption(String(i))
        }
        
        isPossiblePassword = secondOption(String(i), &isLastVowel, &sameVowelCounter)
        if !isPossiblePassword { break }
        isPossiblePassword = thirdOption(String(i), &lastWord)
        if !isPossiblePassword { break }
    }
        
    if !isVowelExist {
        isPossiblePassword = false
    }
    
    switch isPossiblePassword {
    case true: print("<\(input)> is acceptable.")
    case false: print("<\(input)> is not acceptable.")
    }
}

