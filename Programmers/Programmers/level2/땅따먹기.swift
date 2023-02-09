//
//  땅따먹기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/09.
//

import Foundation

func solution(land:[[Int]]) -> Int {
    var dp = land
    
    for i in 0..<land.count - 1 {
        dp[i + 1][0] += max(dp[i][1], dp[i][2], dp[i][3])
        dp[i + 1][1] += max(dp[i][0], dp[i][2], dp[i][3])
        dp[i + 1][2] += max(dp[i][0], dp[i][1], dp[i][3])
        dp[i + 1][3] += max(dp[i][0], dp[i][1], dp[i][2])
    }
    
    return dp[land.count - 1].max()!
}
