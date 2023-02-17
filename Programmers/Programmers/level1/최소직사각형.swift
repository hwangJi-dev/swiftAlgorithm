//
//  최소직사각형.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/27.
//

import Foundation

func solution(sizes:[[Int]]) -> Int {
    var result = sizes[0].sorted()
    
    for i in 1..<sizes.count {
        if result[0] < sizes[i].sorted()[0] {
            result[0] = sizes[i].sorted()[0]
        }
        if result[1] < sizes[i].sorted()[1] {
            result[1] = sizes[i].sorted()[1]
        }
    }
    
    return result.reduce(1, *)
}

//func solution(sizes:[[Int]]) -> Int {
//    var MAX = 0
//    var MIN = 0
//
//    for size in sizes {
//        MAX = max(size.max()!, MAX)
//        MIN = max(size.min()!, MIN)
//    }
//
//    return MAX * MIN
//}
