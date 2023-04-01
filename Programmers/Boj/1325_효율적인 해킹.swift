//
//  1325_효율적인 해킹.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/01.
//

import Foundation

func solution1325() {
    let MN = readLine()!.split(separator: " ").map({ Int($0)! })
    var graph: [Int: [Int]] = [:]
    
    for _ in 1...MN[1] {
        let nodes = readLine()!.split(separator: " ").map({ Int($0)! })

        if graph[nodes[1]] == nil {
            graph[nodes[1]] = [nodes[0]]
        } else {
            graph[nodes[1]]?.append(nodes[0])
        }
    }
    
    func dfs(graph: [Int: [Int]], start: Int, visited: [Int]) -> [Int] {
        var visited = visited
        
        if let nodes = graph[start] {
            for i in nodes {
                if !visited.contains(i) {
                    visited.append(i)
                    visited = dfs(graph: graph, start: i, visited: visited)
                }
            }
        }
        
        return visited
    }
    
    var hackingCountArr: [Int] = [Int](repeating: 0, count: MN[0] + 1)
    
    for i in graph.keys {
        let res = dfs(graph: graph, start: i, visited: []).count
        hackingCountArr[i] = res
    }
    
    let maxCnt = hackingCountArr.max()
    
    for (idx, i) in hackingCountArr.enumerated() {
        if i == maxCnt {
            print(idx)
        }
    }
}
