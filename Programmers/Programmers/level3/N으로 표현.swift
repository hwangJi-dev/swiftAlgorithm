//
//  N으로 표현.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/11.
//

import Foundation

func solution(N:Int, number:Int) -> Int {
    var dp = Array(repeating: Set<Int>(), count: 9)
    var result = Int.max
    
    for i in 1..<9 {
        for j in 1..<i {
            for k in dp[i - j] {
                for l in dp[j] {
                    // +
                    dp[i].insert(k + l)
                    
                    // -
                    if k - l > 0 {
                        dp[i].insert(k - l)
                        if k - l == number { result = min(result, i) }
                    }
                    
                    // *
                    dp[i].insert(k * l)
                    
                    // /
                    if l != 0 && k != 0 {
                        dp[i].insert(k / l)
                        if k / l == number { result = min(result, i) }
                    }
                    
                    if k + l == number || k * l == number { result = min(result, i) }
                }
            }
        }
        
        let nstr = Int(String(repeating: "\(N)", count: i))!
        dp[i].insert(nstr)
        if nstr == number { result = min(result, i) }
    }
    
    return result == Int.max ? -1 : result
}
