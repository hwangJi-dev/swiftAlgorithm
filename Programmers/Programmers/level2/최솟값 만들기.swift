//
//  최솟값 만들기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/14.
//

import Foundation

func solution(A:[Int], B:[Int]) -> Int {
    var ans = 0
    let B = B.sorted(by: >)
    
    for (index, a) in A.sorted().enumerated() {
        ans += a * B[index]
    }

    return ans
}
