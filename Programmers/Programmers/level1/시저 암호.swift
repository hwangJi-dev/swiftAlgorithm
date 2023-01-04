//
//  시저 암호.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/05.
//

import Foundation

func solution(s:String, n:Int) -> String {
    let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    var result = ""
    
    for i in s {
        if i == " " {
            result += " "
        } else {
            var idx = 0
            for (index, j) in alphabet.enumerated() {
                idx = i.lowercased() == j ? index : idx
            }
            
            idx = idx + n > 25 ? idx + n - 26 : idx + n
            result += i.isUppercase ? alphabet[idx].uppercased() : alphabet[idx]
        }
    }
    
    return result
}
