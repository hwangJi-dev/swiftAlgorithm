//
//  1463_1로 만들기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/05.
//

import Foundation

func solution1463() {
    let X = Int(readLine()!)!
    var minCalArr = Array(repeating: 0, count: X + 1)
    
    if X == 1 {
        print(0)
    } else {
        for i in 2...X {
            minCalArr[i] = minCalArr[i - 1] + 1 // 이전 수의 연산횟수에서 1을 더한다 == 이전 수로 갈 때 -1 연산을 수행한다
            
            if i % 2 == 0 {
                minCalArr[i] = min(minCalArr[i], minCalArr[i / 2] + 1)
            }
            
            if i % 3 == 0 {
                minCalArr[i] = min(minCalArr[i], minCalArr[i / 3] + 1)
            }
            
            // -1, //2 //3 연산 중 가장 작은 연산횟수가 i의 최소 연산횟수가 된다.
        }
        
        print(minCalArr[X])
    }
}

