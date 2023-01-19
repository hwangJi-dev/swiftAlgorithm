//
//  음양 더하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/19.
//

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result = 0
    
    for (index, absolute) in absolutes.enumerated() {
        result += signs[index] == false ? -absolute : absolute
    }
    
    return result
}

//return (0..<absolutes.count).map { signs[$0] ? absolutes[$0] : -absolutes[$0] }.reduce(0, +)
