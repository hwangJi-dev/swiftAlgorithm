//
//  2606_바이러스.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/30.
//

import Foundation

func solution2606() -> Int {
    let computerCount = Int(readLine()!)!
    let connectCount = Int(readLine()!)!
    
    var graph: [String: [String]] = [:]
    
    for _ in 0..<connectCount {
        let connect = readLine()!.split(whereSeparator: { $0 == " " }).map({ String($0) })
        let node1 = connect[0]
        let node2 = connect[1]
        
        if graph[node1] == nil {
            graph[node1] = [node2]
        } else {
            graph[node1]?.append(node2)
        }
        
        if graph[node2] == nil {
            graph[node2] = [node1]
        } else {
            graph[node2]?.append(node1)
        }
    }
    
    let warmVirusComputerArr = dfs(graph, "1")
    return warmVirusComputerArr.count - 1
}

func dfs(_ graph: [String: [String]], _ start: String) -> [String] {
    var needToVisitStack: [String] = [start]
    var visitedQueue: [String] = []
    
    while !needToVisitStack.isEmpty {
        let node = needToVisitStack.removeLast()
        
        if visitedQueue.contains(node) { continue }
        visitedQueue.append(node)
        
        needToVisitStack += graph[node] ?? []
    }
    
    return visitedQueue
}
