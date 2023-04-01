//
//  2178_미로탐색.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/01.
//

import Foundation

//func solution2178() {
//    let NM = readLine()!.split(separator: " ").map({ Int($0)! })
//    var miros: [[Int]] = []
//
//    for _ in 0..<NM[0] {
//        let miro = readLine()!
//        miros.append(Array(miro).map({ Int(String($0))! }))
//    }
//
//    var visited = Array(repeating: Array(repeating: false, count: miros[0].count), count: miros.count)
//    var minDistance = Int.max
//
//    func dfs(start: [Int], count: Int) {
//        // 이동할 수 있는 좌표계가 아니라면 함수 return
//        if start[0] < 0 || start[0] > miros.count - 1 || start[1] < 0 || start[1] > miros[0].count - 1 { return }
//
//        // N, M에 도달했다면
//        if start == [NM[0] - 1, NM[1] - 1] {
//            if minDistance > count {
//                minDistance = count
//            }
//            return
//        }
//
//        // 방문되지 않았고, 1로 지나갈 수 있는 미로라면
//        if !visited[start[0]][start[1]] && miros[start[0]][start[1]] == 1 {
//            // 방문 처리
//            visited[start[0]][start[1]] = true
//
//            // 상 하 좌 우 좌표로 이동
//            dfs(start: [start[0] + 1, start[1]], count: count + 1)
//            dfs(start: [start[0] - 1, start[1]], count: count + 1)
//            dfs(start: [start[0], start[1] + 1], count: count + 1)
//            dfs(start: [start[0], start[1] - 1], count: count + 1)
//            visited[start[0]][start[1]] = false
//        }
//    }
//
//    dfs(start: [0,0], count: 1)
//    print(minDistance)
//}


func solution2178() {
    let NM = readLine()!.split(separator: " ").map({ Int($0)! })
    var miros: [[Int]] = []
    
    for _ in 0..<NM[0] {
        let miro = readLine()!
        let miroArr = Array(miro).map({ Int(String($0))! })
        miros.append(miroArr)
    }
    
    // 이동할 네 방향 정의 (좌, 우, 상, 하)
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    func bfs(x: Int, y: Int) -> Int {
        var queue: [[Int]] = []
        queue.append([x, y])
        
        while !queue.isEmpty {
            let c = queue.removeFirst()
            // 현위치 cx, cy
            let cx = c[0]
            let cy = c[1]
            
            // 현위치에서 네 방향으로 위치 확인
            for i in 0..<4 {
                let nx = cx + dx[i]
                let ny = cy + dy[i]
                
                // 미로찾기 공간을 벗어난 경우 무시
                if nx < 0 || ny < 0 || nx > miros.count - 1 || ny > miros[0].count - 1 {
                    continue
                }
                
                // 벽인 경우 무시
                if miros[nx][ny] == 0 { continue }
                
                // 해당 노드를 처음 방문하는 경우라면 1이 저장되어 있을 것이므로
                // 해당 경우에만 최단 거리를 기록한다
                if miros[nx][ny] == 1 {
                    // 현재 위치의 거리 정보 + 1
                    miros[nx][ny] = miros[cx][cy] + 1
                    queue.append([nx, ny])
                }
            }
        }
        
        return miros[NM[0] - 1][NM[1] - 1]
    }
    
    print(bfs(x: 0, y: 0))
}
