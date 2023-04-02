//
//  14940_쉬운 최단거리.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/02.
//

import Foundation

func solution14940() {
    let NM = readLine()!.split(separator: " ").map({ Int(String($0))! })
    var maps: [[Int]] = []
    
    for _ in 0..<NM[0] {
        let m = readLine()!.split(separator: " ").map({ Int(String($0))! })
        maps.append(m)
    }
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    func bfs(x: Int, y: Int) {
        var queue: [[Int]] = [[x, y]]
        
        while !queue.isEmpty {
            let c = queue.removeFirst()
            let cx = c[0]
            let cy = c[1]
            
            for i in 0...3 {
                let nx = cx + dx[i]
                let ny = cy + dy[i]
                
                if nx < 0 || ny < 0 || nx > maps.count - 1 || ny > maps[0].count - 1 { continue }
                if maps[nx][ny] == 0 { continue }
                
                if maps[nx][ny] == 1 {
                    maps[nx][ny] = maps[cx][cy] + 1
                    queue.append([nx, ny])
                }
            }
        }
    }
    
    // 목표좌표 2 찾기
    var destination: [Int] = []
    for (idx, i) in maps.enumerated() {
        if let jdx = i.firstIndex(of: 2) {
            destination = [idx, jdx]
            break
        }
    }
    
    // 목표 좌표로부터 bfs 수행
    bfs(x: destination[0], y: destination[1])
    
    // 배열의 값이 0보다 크다면 -> 값 - 2
    // 1이라면 -> 원래 갈 수 있는 땅인 부분 중에서 도달할 수 없는 위치이므로 -> -1
    maps = maps.map({ $0.map({ $0 > 0 ? ($0 == 1 ? -1 : $0 - 2) : $0 })})
    
    for i in maps {
        print(i.map({ String($0) }).joined(separator: " "))
    }
}
