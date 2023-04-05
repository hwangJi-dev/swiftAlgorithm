//
//  9095_1, 2, 3 더하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/05.
//

import Foundation

func solution9095() {
    let TC = Int(readLine()!)!
    var sumCaseArr = Array(repeating: 0, count: 11)
    
    sumCaseArr[1] = 1
    sumCaseArr[2] = 2
    sumCaseArr[3] = 4
    
    for i in 4...10 {
        sumCaseArr[i] = sumCaseArr[i - 1] + sumCaseArr[i - 2] + sumCaseArr[i - 3]
    }
    
    for _ in 0..<TC {
        let n = Int(readLine()!)!
        print(sumCaseArr[n])
    }
}
