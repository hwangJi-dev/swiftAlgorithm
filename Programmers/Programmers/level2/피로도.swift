//
//  피로도.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/21.
//

import Foundation

var cnt = 0

func solution(k:Int, dungeons:[[Int]]) -> Int {
    var arr = Array(repeating: false, count: dungeons.count)
    dfs(k: k, dungeons: dungeons, visited: &arr, count: 0)
    return cnt
}

func dfs(k: Int, dungeons: [[Int]], visited: inout [Bool], count: Int) {
    if !visited.contains(false) {
        cnt = count > cnt ? count : cnt
        return
    }
    
    for i in 0..<dungeons.count {
        if !visited[i] {
            visited[i] = true
            
            if k < dungeons[i][0] {
                dfs(k: k, dungeons: dungeons, visited: &visited, count: count)
            } else {
                dfs(k: k - dungeons[i][1], dungeons: dungeons, visited: &visited, count: count + 1)
            }
            
            visited[i] = false
        }
    }
}
