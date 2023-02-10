//
//  행렬 테두리 회전하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/10.
//

import Foundation

var ans: [Int] = []
func solution(rows:Int, columns:Int, queries:[[Int]]) -> [Int] {
    var arr: [[Int]] = []
    
    for i in 0..<rows {
        arr.append([Int]((i * columns) + 1...(i * columns) + columns))
    }
    
    for query in queries {
        arr = rotateArr(arr, query[1] - 1, query[0] - 1, query[3] - 1, query[2] - 1)
    }

    return ans
}

func rotateArr(_ arr: [[Int]], _ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> [[Int]] {
    var rotateArr = arr
    let first = rotateArr[y1 + 1][x1]
    var changeArr = [first]
    
    for i in x1 + 1...x2 {
        rotateArr[y1][i] = arr[y1][i - 1]
        changeArr.append(arr[y1][i - 1])
    }
    
    for i in y1 + 1...y2 {
        rotateArr[i][x2] = arr[i - 1][x2]
        changeArr.append(arr[i - 1][x2])
    }
    
    for i in stride(from: x2 - 1, to: x1 - 1, by: -1) {
        rotateArr[y2][i] = arr[y2][i + 1]
        changeArr.append(arr[y2][i + 1])
    }
    
    for i in stride(from: y2 - 1, to: y1, by: -1) {
        rotateArr[i][x1] = arr[i + 1][x1]
        changeArr.append(arr[i + 1][x1])
    }
    
    rotateArr[y1][x1] = first
    
    ans.append(changeArr.sorted().first!)
    return rotateArr
}
