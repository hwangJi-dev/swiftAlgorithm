//
//  콜라츠 추측.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/19.
//

import Foundation

func solution6(_ num:Int) -> Int {
    var num = num
    var result = 0
    
    while num != 1 {
        if num % 2 == 0 {
            num /= 2
        } else {
            num = num * 3 + 1
        }
        
        result += 1
        
        if result >= 500 {
            result = -1
            break
        }
    }
    
    return result
}
