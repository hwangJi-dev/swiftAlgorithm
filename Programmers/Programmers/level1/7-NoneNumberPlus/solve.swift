//
//  solve.swift
//  ProgrammersLevel1
//
//  Created by hwangJi on 2022/08/01.
//

import Foundation

func solution(_ numbers:[Int]) -> Int {
    var answer: Int = 0
    let fullNumberList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let notFoundNumberList = fullNumberList.filter{ !numbers.contains($0) }
   
    for i in notFoundNumberList {
        answer += i
    }
    
    return answer
}
