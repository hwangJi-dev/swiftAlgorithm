//
//  11725_트리의 부모 찾기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/01.
//

import Foundation

func solution11725() {
    var graph: [Int: [Int]] = [:]
    let N = Int(readLine()!)!
    
    for _ in 1..<N {
        let nodes = readLine()!.split(separator: " ").map({ Int(String($0))! })
        if graph[nodes[0]] == nil {
            graph[nodes[0]] = [nodes[1]]
        } else {
            graph[nodes[0]]?.append(nodes[1])
        }
        
        if graph[nodes[1]] == nil {
            graph[nodes[1]] = [nodes[0]]
        } else {
            graph[nodes[1]]?.append(nodes[0])
        }
    }
    
    var visited = Array(repeating: 0, count: N + 1)
    
    func dfs(graph: [Int: [Int]], start: Int) {
        if let nodes = graph[start] {
            for i in nodes {
                if visited[i] == 0 {
                    visited[i] = start
                    dfs(graph: graph, start: i)
                }
            }
        }
    }
    
    dfs(graph: graph, start: 1)
    
    for i in 2...N {
        print(visited[i])
    }
}
