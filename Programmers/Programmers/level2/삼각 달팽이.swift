//
//  삼각 달팽이.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/04.
//

import Foundation

func solution2(n:Int) -> [Int] {
    var n = n
    var triangleIdx = 1
    var triangleFilledCnt = 1
    var number = 1
    var y = -1 // y 좌표
    var ansArr: [[Int]] = []
    
    for i in 1...n {
        ansArr.append(Array(repeating: 0, count: i))
    }
    
    while n > 0 {
        switch triangleIdx % 3 {
        case 0:
            y -= 1
            ansArr[y][ansArr[y].lastIndex(of: 0) ?? 0] = number
        case 1:
            y += 1
            ansArr[y][ansArr[y].firstIndex(of: 0) ?? 0] = number
        default:
            ansArr[y][ansArr[y].firstIndex(of: 0) ?? 0] = number
        }
         
        // 기점: 4 / 3 / 2 / 1
        if triangleFilledCnt == n {
            n -= 1 // 기준 숫자 - 1
            triangleIdx += 1 // 삼각형 index + 1
            triangleFilledCnt = 0
        }
        
        number += 1
        triangleFilledCnt += 1
    }
    
    return ansArr.flatMap({ $0 })
}
