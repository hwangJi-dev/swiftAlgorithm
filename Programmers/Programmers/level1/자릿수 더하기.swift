//
//  자릿수 더하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/10.
//

import Foundation

func solution3(_ n:Int) -> Int {
    var answer:Int = 0
    var n = n

    while n != 0 {
        answer += n % 10
        n /= 10
    }

    return answer
}
