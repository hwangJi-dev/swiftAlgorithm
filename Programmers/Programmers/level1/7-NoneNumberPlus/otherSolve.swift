//
//  otherSolve.swift
//  ProgrammersLevel1
//
//  Created by hwangJi on 2022/08/01.
//

import Foundation

func solution1(_ numbers:[Int]) -> Int {
    var answer = 0
    
    for i in 0...9 {
        if !numbers.contains(i) {
            answer += i
        }
    }
    
    return answer
}

func solution2(_ numbers:[Int]) -> Int {
    return (0...9).filter { !numbers.contains($0) }.reduce(0, +)
}
