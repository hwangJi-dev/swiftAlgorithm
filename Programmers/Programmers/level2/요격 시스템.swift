//
//  요격 시스템.swift
//  Programmers1
//
//  Created by hwangJi on 2023/05/23.
//

import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var targets = targets.sorted(by: { $0[0] < $1[0] })
    let f = targets.removeFirst()
    var queue: [(Int, Int)] = [(f[0], f[1])]
    var ans = 1
    
    for t in targets {
        if let q = queue.last {
            if q.1 > t[0] {
                if q.1 > t[1] {
                    queue[queue.count - 1].1 = t[1]
                }
            } else {
                queue.append((t[0], t[1]))
                ans += 1
            }
        }
    }
    
    return ans
}
