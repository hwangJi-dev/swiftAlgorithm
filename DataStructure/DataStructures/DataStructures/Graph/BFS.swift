//
//  BFS.swift
//  DataStructures
//
//  Created by hwangJi on 2022/11/23.
//

import Foundation

func BFS(graph: [String: [String]], start: String) -> [String] {
    // 방문한 노드 정보를 저장하는 Queue
    var visitedQueue: [String] = []
    
    // queue에 첫번째 노드 넣으며 시작
    var needVisitQueue: [String] = [start]
    
    // 방문 예정 노드가 담긴 queue가 비어있지 않다면 => 반복
    while !needVisitQueue.isEmpty {
        let node: String = needVisitQueue.removeFirst() // Queue 자료구조를 활용하므로 FIFO
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitQueue += graph[node] ?? []
    }
    
    return visitedQueue
}
