//
//  다트 게임.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/13.
//

import Foundation

@available(macOS 13.0, *)
func solution(dartResult:String) -> Int {
    let dict = ["S": 1, "D": 2, "T": 3, "*": 2, "#": -1]
    var str: [String] = Array(dartResult).map({ String($0) })
    var dart = dartResult.filter{ !$0.isNumber }.map{ String($0) }
    var num: [Int] = []
    var cutIndex = 0
    
    for (index, i) in dartResult.enumerated() {
        if dart.contains(String(i)) {
            let n = str[cutIndex..<index].joined()
            if n != "" {
                num.append(Int(n)!)
            }
            cutIndex = index + 1
            
            if i == "S" {
                num[num.count - 1] = Int(pow(Double(num[num.count - 1]), 1))
            } else if i == "D" {
                num[num.count - 1] = Int(pow(Double(num[num.count - 1]), 2))
            } else if i == "T" {
                num[num.count - 1] = Int(pow(Double(num[num.count - 1]), 3))
            } else if i == "*" {
                if num.count - 2 >= 0 {
                    num[num.count - 1] *= 2
                    num[num.count - 2] *= 2
                } else {
                    num[num.count - 1] *= 2
                }
            } else {
                num[num.count - 1] *= -1
            }
        }
    }

    return num.reduce(0, +)
}
