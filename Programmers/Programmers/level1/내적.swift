//
//  내적.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/23.
//

import Foundation


func solution3(_ a:[Int], _ b:[Int]) -> Int {
    var result = 0
    
    for i in 0...a.count - 1 {
        result += a[i] * b[i]
    }
    
    return result
}
