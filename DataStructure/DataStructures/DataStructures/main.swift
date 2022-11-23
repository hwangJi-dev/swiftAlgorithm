//
//  main.swift
//  DataStructures
//
//  Created by hwangJi on 2022/11/23.
//

import Foundation

// 인접 리스트 방식으로 만든 그래프
var graph: [String: [String]] = [
    "A" : ["D", "C", "B"],
    "B" : ["E"],
    "C" : ["F"],
    "D" : ["H", "G"],
    "E" : ["J", "I"],
    "F" : [],
    "G" : [],
    "H" : ["K"],
    "I" : [],
    "J" : [],
    "K" : []
]

print(DFS(graph: graph, start: "A"))
