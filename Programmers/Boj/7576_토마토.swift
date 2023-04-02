//
//  7576_토마토.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/02.
//

import Foundation

func solution7576() {
    let box = readLine()!.split(separator: " ").map({ Int(String($0))! })
    var tomatos: [[Int]] = []
    var ripeTomatos: [[Int]] = []
    var lastDay = 0
    var isFirstAllRipe = true
    
    for n in 0..<box[1] {
        let tomato = readLine()!.split(separator: " ").map({ Int(String($0))! })
        tomatos.append(tomato)
        
        // 좌표 1 찾기
        for (mdx, m) in tomato.enumerated() {
            if m == 1 {
                ripeTomatos.append([n, mdx])
            } else if m == 0 {
                isFirstAllRipe = false
            }
        }
    }
    
    func bfs() {
        var queue: [[Int]?] = ripeTomatos // queue는 FIFO이므로 이미 익은 좌표들부터 차례로 방문하여 토마토를 익힐 수 있다.
        var pointer = 0
        
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        
        while pointer < queue.count {
            let cx = queue[pointer]![0]
            let cy = queue[pointer]![1]
            queue[pointer] = nil
            pointer += 1
            
            for i in 0...3 {
                let nx = cx + dx[i]
                let ny = cy + dy[i]
                
                if nx < 0 || ny < 0 || nx > tomatos.count - 1 || ny > tomatos[0].count - 1 {
                    continue
                }
                
                if tomatos[nx][ny] == -1 {
                    continue
                }
                
                if tomatos[nx][ny] == 0 {
                    tomatos[nx][ny] = tomatos[cx][cy] + 1
                    queue.append([nx, ny])
                    lastDay = tomatos[nx][ny] - 1
                }
            }
        }
    }
    
    var isAllRipe = true
    
    // 만약, 저장될 때부터 모든 토마토가 익어있는 상태이면 0 출력
    if isFirstAllRipe {
        print(0)
    } else {
        bfs()
        
        for i in tomatos {
            if i.contains(0) {
                isAllRipe = false
            }
        }
        
        if isAllRipe {
            print(lastDay)
        } else {
            // 토마토가 모두 익지는 못하는 상황이면 -1을 출력
            print(-1)
        }
    }
}
