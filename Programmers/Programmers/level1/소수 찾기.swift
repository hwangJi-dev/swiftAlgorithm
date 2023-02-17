//
//  소수 찾기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/04.
//

import Foundation

func solution(n: Int) -> Int {
    var result = 0
    
    for i in 2...n {
        if i < 4 {
            result += 1
        } else {
            var isPrime = false
            for j in 2...Int(sqrt(Double(i))) {
                if i % j == 0 {
                    isPrime = true
                    break
                }
            }
            result += isPrime ? 0 : 1
        }
    }
    
    return result
}
