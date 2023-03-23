//
//  GenomicRangeQuery.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/23.
//

import Foundation

public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    var a = Array(repeating: 0, count: S.count + 1)
    var c = Array(repeating: 0, count: S.count + 1)
    var g = Array(repeating: 0, count: S.count + 1)
    var t = Array(repeating: 0, count: S.count + 1)
    var ans: [Int] = []
    
    for (idx, i) in S.enumerated() {
        a[idx + 1] = a[idx]
        c[idx + 1] = c[idx]
        g[idx + 1] = g[idx]
        t[idx + 1] = t[idx]
        
        switch i {
        case "A":
            a[idx + 1] += 1
        case "C":
            c[idx + 1] += 1
        case "G":
            g[idx + 1] += 1
        default:
            t[idx + 1] += 1
            
        }
    }
    
    for i in 0..<P.count {
        if a[Q[i] + 1] - a[P[i]] > 0 {
            ans.append(1)
        } else if c[Q[i] + 1] - c[P[i]] > 0 {
            ans.append(2)
        } else if g[Q[i] + 1] - g[P[i]] > 0 {
            ans.append(3)
        } else {
            ans.append(4)
        }
    }
    
    return ans
}
