//
//  두 개 뽑아서 더하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/27.
//

import Foundation

func solution(numbers:[Int]) -> [Int] {
    var result: Set<Int> = []
    
    for (index, number) in numbers.enumerated() {
        for j in 0..<numbers.count {
            if j != index {
                result.insert(number + numbers[j])
            }
        }
    }
    
    return result.map({ Int($0) }).sorted()
}
