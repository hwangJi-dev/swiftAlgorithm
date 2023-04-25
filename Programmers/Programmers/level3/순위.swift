//
//  순위.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/25.
//

import Foundation

func solution(n:Int, results:[[Int]]) -> Int {
    var graph: [Int: [Int]] = [:]
    var winGraph: [Int: [Int]] = [:]
    var ans = 0
    
    for i in results {
        if graph[i[1]] == nil {
            graph[i[1]] = [i[0]]
        } else {
            graph[i[1]]?.append(i[0])
        }
        
        if winGraph[i[0]] == nil {
            winGraph[i[0]] = [i[1]]
        } else {
            winGraph[i[0]]?.append(i[1])
        }
    }
    
    func dfs(_ isWin: Bool, _ start: Int) -> [Int] {
        var visitedQueue: [Int] = []
        var neetToVisitStack: [Int] = [start]
        
        while !neetToVisitStack.isEmpty {
            let node = neetToVisitStack.removeLast()
            
            if visitedQueue.contains(node) { continue }
            
            visitedQueue.append(node)
            
            if isWin {
                neetToVisitStack += winGraph[node] ?? []
            } else {
                neetToVisitStack += graph[node] ?? []
            }
        }
        
        return visitedQueue
    }
    
    for i in 1...n {
        let win = dfs(true, i)
        let lose = dfs(false, i)
        
        if Set(win + lose).count == n {
            ans += 1
        }
    }
    
    return ans
}
