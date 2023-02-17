//
//  무인도 여행.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/27.
//

import Foundation

var visited: [[Bool]] = []
var sum = 0

func solution(maps:[String]) -> [Int] {
    var ans: [Int] = []
    var mapArr: [[String]] = []
    
    maps.forEach({ mapArr.append(Array($0).map({ String($0) })) })
    visited = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
    
    for (i, col) in mapArr.enumerated() {
        for (j, row) in col.enumerated() {
            if row != "X" && visited[i][j] == false {
                dfs(index: (i, j), maps: mapArr)
                ans.append(sum)
                sum = 0
            }
        }
    }
    
    return ans == [] ? [-1] : ans.sorted()
}

func dfs(index: (Int, Int), maps: [[String]]) {
    let u = (index.0 - 1 < 0 ? index.0 : index.0 - 1, index.1)
    let d = (index.0 + 1 >= maps.count ? index.0 : index.0 + 1, index.1)
    let l = (index.0, index.1 - 1 < 0 ? index.1 : index.1 - 1)
    let r = (index.0, index.1 + 1 >= maps[0].count ? index.1 : index.1 + 1)
    
    visited[index.0][index.1] = true
    
    for point in [u, d, l, r] {
        if visited[point.0][point.1] == false && maps[point.0][point.1] != "X" {
            dfs(index: (point.0, point.1), maps: maps)
        }
    }
    
    sum += Int(maps[index.0][index.1])!
}
