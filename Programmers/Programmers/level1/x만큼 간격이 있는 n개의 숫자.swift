//
//  x만큼 간격이 있는 n개의 숫자.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/19.
//

import Foundation
 
func solution(x:Int, n:Int) -> [Int64] {
    var result: [Int64] = []
    for i in 1...n {
        result.append(Int64(x * i))
    }
    return result
}
