//
//  양과 늑대.swift
//  Programmers1
//
//  Created by hwangJi on 2022/09/24.
//

import Foundation

var dfsGraph: [Int: [Int]] = [:]
var maxSheepCount = -1

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    for edge in edges {
        if dfsGraph[edge[0]] != nil {
            dfsGraph[edge[0]]?.append(edge[1])
        } else {
            dfsGraph[edge[0]] = [edge[1]]
        }
    }
    
    // 루트 노드부터 탐색시 루트 노드에는 무조건 양이 있기 때문에 count를 [1,0]으로 전달한다.
    dfs(info, dfsGraph[0]!, [1,0])
    
    return maxSheepCount
}

func dfs(_ info: [Int], _ visitableNodes: [Int], _ count: [Int]) {
    maxSheepCount = max(count[0], maxSheepCount)
    
    for (index, visitNode) in visitableNodes.enumerated() {
        var nextVisitNodes = visitableNodes
        nextVisitNodes.remove(at: index)
        nextVisitNodes.append(contentsOf: dfsGraph[visitNode] ?? [])
        
        // 양과 늑대의 수 비교
        var nowCount = count
        if info[visitNode] == 0 {
            nowCount[0] += 1
        } else {
            nowCount[1] += 1
        }
        
        if nowCount[0] > nowCount[1] {
            dfs(info, nextVisitNodes, nowCount)
        }
    }
}
