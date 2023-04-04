//
//  택배상자.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/04.
//

import Foundation

func solution(order:[Int]) -> Int {
    var assistant: [Int] = []
    var c = 1
    var boxCnt = 0
    
    for i in order {
        while c <= i {
            assistant.append(c)
            c += 1
        }
        
        if assistant.last == i {
            assistant.removeLast()
            boxCnt += 1
        } else {
            break
        }
    }
    
    return boxCnt
}
