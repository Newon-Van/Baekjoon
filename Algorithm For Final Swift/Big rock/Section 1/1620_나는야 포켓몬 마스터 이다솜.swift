//
//  1620_나는야 포켓몬 마스터 이다솜.swift
//  Algorithm For Final Swift
//
//  Created by Kim Yewon on 2023/01/06.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])

var pokedexString = [String:Int]()
var pokedexNumber = [Int:String]()


for i in 1 ... N {
   let temp = readLine()!
    pokedexString[temp] = i
    pokedexNumber[i] = temp
}

for _ in 0 ..< M {
    let temp = readLine()!
    
    if let number = Int(temp) {
        print(pokedexNumber[number]!)
    } else {
        print(pokedexString[temp]!)
    }
}
