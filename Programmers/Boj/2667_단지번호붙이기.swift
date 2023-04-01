//
//  2667_단지번호붙이기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/01.
//

import Foundation

func solution2667() {
    let N = Int(readLine()!)!
    var houseArr: [[Int]] = []
    
    for _ in 0..<N {
        let house = readLine()!
        houseArr.append(Array(house).map({ Int(String($0))! }))
    }
    
    var visited = Array(repeating: Array(repeating: false, count: houseArr[0].count), count: houseArr.count)
    var count = 0
    
    func dfs(xy: [Int]) {
        let x = xy[0]
        let y = xy[1]
        
        if x < 0 || y < 0 || x > houseArr.count - 1 || y > houseArr[0].count - 1 { return }

        if !visited[x][y] && houseArr[x][y] == 1 {
            visited[x][y] = true
            count += 1
            dfs(xy: [x + 1, y])
            dfs(xy: [x - 1, y])
            dfs(xy: [x, y + 1])
            dfs(xy: [x, y - 1])
        }
    }
    
    var ans: [Int] = []
    
    for (idx, i) in houseArr.enumerated() {
        for (jdx, _) in i.enumerated() {
            if !visited[idx][jdx] && houseArr[idx][jdx] == 1 {
                count = 0
                dfs(xy: [idx, jdx])
                ans.append(count)
            }
        }
    }
    
    print(ans.count)
    for a in ans.sorted() {
        print(a)
    }
}
