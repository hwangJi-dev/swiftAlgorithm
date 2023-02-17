//
//  숫자 변환하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/30.
//

import Foundation

func solution(x:Int, y:Int, n:Int) -> Int {
    if x == y {
        return 0
    }
    
    var dp: [Int: Int] = [x: 0]
    var data = [x]
    
    while data.count != 0 {
        var calResult: [Int] = []
        
        for d in data {
            // d에 n을 더하고, 2를 곱하고, 3을 곱하는 연산을 각각 수행한다.
            for c in [d + n, d * 2, d * 3] {
                // 연산 결과가 y보다 크거나 이미 연산된 값이라면 반복문을 탈출한다.
                if (c > y || dp[c] != nil) {
                    continue
                }
                // 연산 결과가 y값과 같다면 1을 더한 값을 도출한다.
                if c == y {
                    return dp[d]! + 1
                }
                // 메모리에 c의 연산 횟수를 기록한다
                dp[c] = dp[d]! + 1
                calResult.append(c)
            }
        }
        
        //  data에 다음 연산 비교군을 할당한다.
        data = calResult
    }
    
    return -1
}
