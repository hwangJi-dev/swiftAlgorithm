//
//  2579_계단 오르기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/06.
//

import Foundation

func solution2579() {
    let N = Int(readLine()!)!
    var stairs = Array(repeating: 0, count: N + 1)
    var maxStairs = stairs
    
    for i in 1...N {
        let n = Int(readLine()!)!
        stairs[i] = n
        
        if i == 1 {
            maxStairs[1] = stairs[i]
        } else if i == 2 {
            maxStairs[2] = maxStairs[1] + stairs[i]
        } else {
            maxStairs[i] = max(maxStairs[i - 3] + stairs[i - 1] + stairs[i], maxStairs[i - 2] + stairs[i])
        }
    }
    print(maxStairs[N])
}
