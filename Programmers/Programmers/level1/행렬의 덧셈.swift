//
//  행렬의 덧셈.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/24.
//

import Foundation

func solution3(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = arr1
    for i in 0..<arr1.count {
        for j in 0..<arr1[i].count {
            result[i][j] = arr1[i][j] + arr2[i][j]
        }
    }
    return result
}
