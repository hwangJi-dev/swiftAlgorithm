//
//  11053_가장 긴 증가하는 부분 수열.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/06.
//

import Foundation

func solution11053() {
    let N = Int(readLine()!)!
    let A = readLine()!.split(separator: " ").map({ Int(String($0))! })
    var dp = Array(repeating: 1, count: N)
    
    for i in 0..<N {
        for j in 0..<i {
            if A[j] < A[i] {
                dp[i] = max(dp[j] + 1, dp[i])
            }
        }
    }
    
    print(dp.max()!)
}
