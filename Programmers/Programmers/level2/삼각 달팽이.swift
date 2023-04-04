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
    var triangleFilledCnt = 0 // 삼각형에 채워지는 숫자 개수
    var number = 0 // 계속 오르는 숫자
    var y = -1 // y 좌표
    var ansArr: [[Int]] = []
    
    for i in 1...n {
        ansArr.append(Array(repeating: 0, count: i))
    }
    
    while n > 0 {
        number += 1
        triangleFilledCnt += 1
        
        switch triangleIdx % 3 {
        case 0: // 하강하면서 채워짐
            y -= 1
            ansArr[y][ansArr[y].lastIndex(of: 0) ?? 0] = number
        case 1: // 상승하면서 채워짐
            y += 1
            ansArr[y][ansArr[y].firstIndex(of: 0) ?? 0] = number
        default: // 가장 밑단만 채워짐
            ansArr[y][ansArr[y].firstIndex(of: 0) ?? 0] = number
        }
         
        // 기점: 4 / 3 / 2 / 1
        if triangleFilledCnt == n {
            n -= 1 // 기준 숫자 - 1
            triangleIdx += 1 // 삼각형 index + 1
            triangleFilledCnt = 0
        }
    }
    
    return ansArr.flatMap({ $0 })
}
