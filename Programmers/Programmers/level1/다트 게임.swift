//
//  다트 게임.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/13.
//

import Foundation

@available(macOS 13.0, *)
func solution(dartResult:String) -> Int {
    let dict = ["S": 1, "D": 2, "T": 3]
    let str: [String] = Array(dartResult).map({ String($0) })
    var num: [Int] = []
    var cutIndex = 0
    
    for (index, i) in dartResult.enumerated() {
        switch i {
        case "S", "D", "T":
            num.append(Int(str[cutIndex..<index].joined()) ?? 0)
            num[num.count - 1] = Int(pow(Double(num[num.count - 1]), Double(dict[String(i)]!)))
            cutIndex = index + 1
        case "*":
            num[num.count - 1] *= 2
            if num.count - 2 >= 0 {
                num[num.count - 2] *= 2
            }
            cutIndex = index + 1
        case "#":
            num[num.count - 1] *= -1
            cutIndex = index + 1
        default:
            break
        }
    }

    return num.reduce(0, +)
}
