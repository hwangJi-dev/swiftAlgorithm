//
//  예산.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/20.
//

import Foundation

func solution(d:[Int], budget:Int) -> Int {
    var budget = budget
    var result = 0
    
    for i in d.sorted() {
        if budget - i >= 0 {
            budget -= i
            result += 1
        }
    }
    
    return result
}
