//
//  점프와 순간 이동.swift
//  Programmers1
//
//  Created by hwangJi on 2022/12/24.
//

import Foundation

func solution(_ n:Int) -> Int {
    var n = n
    var ans: Int = 0
    
    while n != 0 {
        if n % 2 == 0 {
            n = n / 2
        } else {
            n = n - 1
            ans += 1
        }
    }

    return ans
}
