//
//  전력망을 둘로 나누기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/25.
//

import Foundation

func solution(n:Int, wires:[[Int]]) -> Int {
    var route: [Int: [Int]] = [:]
    for wire in wires {
        if route[wire[0]] != nil {
            route[wire[0]]?.append(wire[1])
        } else {
            route[wire[0]] = [wire[1]]
        }
        
        if route[wire[1]] != nil {
            route[wire[1]]?.append(wire[0])
        } else {
            route[wire[1]] = [wire[0]]
        }
    }
    
    var result = wires.count
    for i in route {
        for j in i.value {
            // 끊기
            route[i.key] = route[i.key]!.filter({ $0 != j })
            route[j] = route[j]!.filter({ $0 != i.key })
            
            let distance = abs(dfs(route, i.key).count - dfs(route, j).count)
            result = distance < result ? distance : result
            
            // 복구
            route[i.key]?.append(j)
            route[j]?.append(i.key)
        }
    }
    
    return result
}

func dfs(_ arr: [Int: [Int]], _ n: Int) -> [Int] {
    var visitedQueue: [Int] = []
    var needVisitStack: [Int] = [n]
    
    while !needVisitStack.isEmpty {
        let node: Int = needVisitStack.removeLast()
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitStack += arr[node] ?? []
    }
    
    return visitedQueue
}
