//
//  두 정수 사이의 합.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/03.
//

import Foundation

func solution(a:Int, b:Int) -> Int64 {
    var result = 0
    let arr = [a, b].sorted()
    
    for i in arr[0]...arr[1] {
        result += i
    }
    
    return Int64(result)
}
