//
//  삼총사.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/27.
//

import Foundation

func solution(number:[Int]) -> Int {
    var result = 0
    
    for i in 0..<number.count {
        for j in i+1..<number.count {
            for k in j+1..<number.count {
                if number[i] + number[j] + number[k] == 0 {
                    result += 1
                }
            }
        }
    }
    
    return result
}
