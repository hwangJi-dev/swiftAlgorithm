//
//  DFS.swift
//  DataStructures
//
//  Created by hwangJi on 2022/11/23.
//

import Foundation

func DFS(graph: [String: [String]], start: String) -> [String] {
    // 방문한 노드 정보를 저장하는 Queue
    var visitedQueue: [String] = []
    
    // stack에 첫번째 노드 넣으며 시작
    var needVisitStack: [String] = [start]
    
    // 방문 예정 노드가 담긴 stack이 비어있지 않다면 => 반복
    while !needVisitStack.isEmpty {
        let node: String = needVisitStack.removeLast() // stack이기 때문에 -> LIFO
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitStack += graph[node] ?? []
    }
    
    return visitedQueue
}
