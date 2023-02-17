//
//  타겟 넘버.swift
//  Programmers1
//
//  Created by hwangJi on 2022/08/05.
//

import Foundation

var answer: Int = 0

func solution(_ numbers:[Int], _ target:Int) -> Int {
    dfs(numbers: numbers, target: target, index: 0, sum: 0)
    return answer
}

func dfs(numbers: [Int], target: Int, index: Int, sum: Int) {
    if index == numbers.count {
        if target == sum {
            answer += 1
        }
        return
    }

    dfs(numbers: numbers, target: target, index: index + 1, sum: sum + numbers[index])
    dfs(numbers: numbers, target: target, index: index + 1, sum: sum - numbers[index])
}


