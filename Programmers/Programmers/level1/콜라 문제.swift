//
//  콜라 문제.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/27.
//

import Foundation

func solution(a:Int, b:Int, n:Int) -> Int {
    var n = n
    var result = 0
    
    while n >= a {
        result += (n / a) * b
        n = (n / a) * b + (n % a)
    }
    
    return result
}
