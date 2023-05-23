//
//  롤케이크 자륵.swift
//  Programmers1
//
//  Created by hwangJi on 2023/05/23.
//

import Foundation

func solution(topping:[Int]) -> Int {
    var tops = Array(repeating: 0, count: topping.max()! + 1)
    
    for i in topping {
        tops[i] += 1
    }
    
    var pointer = 0
    var q1 = Set(topping).count
    var q2: Set<Int> = []
    var ans = 0
    
    while pointer <= topping.count - 1 {
        let ct = topping[pointer]
        tops[ct] -= 1
        
        if tops[ct] == 0 {
            q1 -= 1
        }
        
        q2.insert(ct)
        if q1 == q2.count {
            ans += 1
        }
        
        pointer += 1
    }
    
    return ans
}
