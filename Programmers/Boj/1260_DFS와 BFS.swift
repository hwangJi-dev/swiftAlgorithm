//
//  1260_DFS와 BFS.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/31.
//

import Foundation

func solution1260() {
    let info = readLine()!.split(separator: " ").map({ Int(String($0))! })
    var graph: [Int: [Int]] = [:]

    for _ in 0..<info[1] {
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

    func dfs(graph: [Int: [Int]], start: Int) -> [Int] {
        var needToVisitStack: [Int] = [start]
        var visitedQueue: [Int] = []
        
        while !needToVisitStack.isEmpty {
            let node = needToVisitStack.removeLast()
            
            if visitedQueue.contains(node) { continue }
            
            visitedQueue.append(node)
            if let nodes = graph[node]?.sorted().reversed() {
                needToVisitStack += nodes
            }
        }
        
        return visitedQueue
    }

    func bfs(graph: [Int: [Int]], start: Int) -> [Int] {
        var needToVisitQueue: [Int] = [start]
        var visitedQueue: [Int] = []
        
        while !needToVisitQueue.isEmpty {
            let node = needToVisitQueue.removeFirst()
            
            if visitedQueue.contains(node) { continue }
            
            visitedQueue.append(node)
            if let nodes = graph[node]?.sorted() {
                needToVisitQueue += nodes
            }
        }
        
        return visitedQueue
    }

    print(dfs(graph: graph, start: info[2]).map({ String($0) }).joined(separator: " "))
    print(bfs(graph: graph, start: info[2]).map({ String($0) }).joined(separator: " "))
}
