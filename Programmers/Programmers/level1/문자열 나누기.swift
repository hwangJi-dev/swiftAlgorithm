//
//  문자열 나누기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/10.
//

import Foundation

func solution4(_ s:String) -> Int {
    var first = s.first
    var count = 0
    var result = 0
    
    for i in s {
        if count == 0 {
            result += 1
            first = i
        }
        
        count = i == first ? count + 1 : count - 1
    }
    
    return result
}
