//
//  [3차] 압축.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/30.
//

import Foundation

func solution(msg: String) -> [Int] {
    var msg = Array(msg).reversed().map({ String($0) })
    var dict: [String: Int] = [:]
    var dictLastVal = 26
    var ans: [Int] = []
    
    //["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9, "J": 10, "K": 11, "L": 12, "M": 13, "N": 14, "O": 15, "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20, "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26]
    for i in 1...26 {
        if let scalar = Unicode.Scalar(64 + i) {
            dict[scalar.description] = i
        }
    }
    
    while !msg.isEmpty {
        var word = ""
        while let w = msg.popLast() {
            word += w
            if let c = msg.last {
                if dict[word + c] == nil {
                    dictLastVal += 1
                    dict[word + c] = dictLastVal
                    break
                }
            }
        }
        ans.append(dict[word]!)
    }
    
    return ans
}
