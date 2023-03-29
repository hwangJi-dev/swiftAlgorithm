//
//  네트워크.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/29.
//

import Foundation

func solution(n:Int, computers:[[Int]]) -> Int {
    var networkDict: [Int: [Int]] = [:]
    
    for (i, ci) in computers.enumerated() {
        if networkDict[i] == nil {
            networkDict[i] = []
        }
        
        for (j, _) in ci.enumerated() {
            if computers[i][j] == 1 {
                networkDict[i]?.append(j)
            }
        }
    }
    return dfsToFindNetwork(networkDict, 0)
}

func dfsToFindNetwork(_ arr: [Int: [Int]], _ start: Int) -> Int {
    var arr = arr
    var networkCount = 0
    var needVisitStack: [Int] = [start]
    var visitedQueue: [Int] = []
    
    while !needVisitStack.isEmpty {
        let node = needVisitStack.removeLast()
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitStack += arr[node] ?? []
        
        if ((arr[node]?.isEmpty) != nil) {
            arr.removeValue(forKey: node)
        }
    }
    networkCount += 1
    
    if arr.count > 0 {
        networkCount += dfsToFindNetwork(arr, arr.first!.key)
    }
    
    return networkCount
}
