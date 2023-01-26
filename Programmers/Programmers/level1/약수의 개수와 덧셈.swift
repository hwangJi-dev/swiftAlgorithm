//
//  약수의 개수와 덧셈.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/26.
//

import Foundation

func solution(left:Int, right:Int) -> Int {
    var result = 0
    for i in left...right {
        result = getDivisor(i) ? result + i : result - i
    }
    return result
}

func getDivisor(_ n: Int) -> Bool {
    var count = 0
    for i in 1...n {
        if n % i == 0 {
            count += 1
        }
    }
    return count % 2 == 0 ? true : false
}
