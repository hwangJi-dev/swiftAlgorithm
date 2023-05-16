//
//  연속 펄스 부분 수열의 합.swift
//  Programmers1
//
//  Created by hwangJi on 2023/05/16.
//

import Foundation

func solution(_ sequence:[Int]) -> Int64 {
    var s1: [Int] = []
    var s2: [Int] = []
    var purse = (-1, 1)
    
    for i in 0..<sequence.count {
        s1.append(sequence[i] * purse.0)
        s2.append(sequence[i] * purse.1)
        purse = (purse.0 * -1, purse.1 * -1)
    }
    
    var dp1 = Array(repeating: 0, count: s1.count)
    var dp2 = Array(repeating: 0, count: s2.count)
    dp1[0] = s1[0]
    dp2[0] = s2[0]
    
    for j in 1..<dp1.count {
        dp1[j] = max(dp1[j - 1] + s1[j], s1[j - 1] + s1[j])
        dp2[j] = max(dp2[j - 1] + s2[j], s2[j - 1] + s2[j])
    }
    
    return Int64(max(dp1.max()!, dp2.max()!))
}
