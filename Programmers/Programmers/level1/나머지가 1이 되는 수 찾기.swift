//
//  나머지가 1이 되는 수 찾기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/18.
//

import Foundation

func solution(n4: Int) -> Int {
    var x = 0
    
    for i in 2...n4 - 1 {
        if n4 % i == 1 {
            x = i
            break
        }
    }
    
    return x
}
