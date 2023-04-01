//
//  프린터.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/01.
//

import Foundation

func solution(priorities:[Int], location:Int) -> Int {
    var priorities = priorities.reversed().map({ Int($0) })
    var printQueue: [Int] = []
    var idx = abs(location - (priorities.count - 1))
    
    while !priorities.isEmpty {
        let p = priorities.popLast()!
        if p < priorities.max() ?? p {
            idx = idx == priorities.count ? 0 : idx + 1
            priorities.insert(p, at: 0)
        } else {
            printQueue.append(p)
            if idx == priorities.count {
                break
            }
        }
    }
    
    return printQueue.count
}
