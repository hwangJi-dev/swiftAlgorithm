//
//  3584_가장 가까운 공통 조상.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/26.
//

import Foundation

func solution3584() {
    let t = Int(readLine()!)!
    
    for _ in 1...t {
        let n = Int(readLine()!)!
        var nodes = Array(repeating: 0, count: n + 1)
        
        for _ in 1..<n {
            let node = readLine()!.components(separatedBy: .whitespaces).map({ Int($0)! })
            nodes[node[1]] = node[0]
        }
        
        func dfs(_ start: Int) -> [Int] {
            var visitedQueue: [Int] = []
            var needToVisitNode = start
            
            while needToVisitNode != 0 {
                visitedQueue.append(needToVisitNode)
                needToVisitNode = nodes[needToVisitNode]
            }
            
            return visitedQueue
        }
        
        let tc = readLine()!.components(separatedBy: .whitespaces).map({ Int($0)! })
        
        func getCommonAncestor(_ n1: Int, _ n2: Int) -> Int {
            let queue1 = dfs(n1)
            let queue2 = dfs(n2)
            return queue1.filter({ queue2.contains($0) }).first!
        }
        
        print(getCommonAncestor(tc[0], tc[1]))
    }
}
