//
//  K번째 수.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/26.
//

import Foundation

func solution(array:[Int], commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    for command in commands {
        result.append(array[command[0] - 1...command[1] - 1].sorted()[command[2] - 1])
    }
    return result
}
