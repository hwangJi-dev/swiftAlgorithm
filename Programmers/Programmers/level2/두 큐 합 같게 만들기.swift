//
//  두 큐 합 같게 만들기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/20.
//

import Foundation

func solution(queue1:[Int], queue2:[Int]) -> Int {
    var maxCnt = queue1.count * 4
    var queue = queue1 + queue2
    var pointer = (0, queue1.count)
    var queue1sum = queue1.reduce(0, +)
    var queue2sum = queue2.reduce(0, +)
    var ans = 0
    
    while queue1sum != queue2sum {
        if queue1sum >= queue2sum {
            queue1sum -= queue[pointer.0]
            queue2sum += queue[pointer.0]
            pointer.0 += pointer.0 + 1 > queue.count - 1 ? 0 : 1
        } else {
            queue1sum += queue[pointer.1]
            queue2sum -= queue[pointer.1]
            pointer.1 += pointer.1 + 1 > queue.count - 1 ? 0 : 1
        }
        
        ans += 1
        
        // 탈출조건
        if ans > maxCnt {
            return -1
        }
    }
    
    return ans
}
