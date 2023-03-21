//
//  숫자 게임.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/21.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    let a = a.sorted(by: >)
    let b = b.sorted(by: >)
    var maxCnt = 0
    var bIndex = 0
    
    for i in a {
        if i < b[bIndex] {
            bIndex += 1
            maxCnt += 1
        }
    }
    
    return maxCnt
}
