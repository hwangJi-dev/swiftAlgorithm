//
//  11726_2×n 타일링.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/06.
//

import Foundation

func solution11726() {
    let N = Int(readLine()!)!
    var rectangleArr = Array(repeating: 0, count: N + 1)
    
    if N == 1 {
        print(1)
    } else if N == 2 {
        print(2)
    } else {
        rectangleArr[1] = 1
        rectangleArr[2] = 2
        
        for i in 3...N {
            rectangleArr[i] = (rectangleArr[i - 1] + rectangleArr[i - 2]) % 10007
        }
        
        print(rectangleArr[N])
    }
}
