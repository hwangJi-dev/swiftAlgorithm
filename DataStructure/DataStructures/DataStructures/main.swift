//
//  main.swift
//  DataStructures
//
//  Created by hwangJi on 2022/11/23.
//

import Foundation

// 인접 리스트 방식으로 만든 그래프
var graph: [String: [String]] = [
    "A" : ["B", "C", "D"],
    "B" : ["A", "E"],
    "C" : ["A", "F"],
    "D" : ["A", "G", "H"],
    "E" : ["B", "I", "J"],
    "F" : ["C"],
    "G" : ["D"],
    "H" : ["D", "K"],
    "I" : ["E"],
    "J" : ["E"],
    "K" : ["H"]
]

print(DFS(graph: graph, start: "A"))
print(BFS(graph: graph, start: "A"))
