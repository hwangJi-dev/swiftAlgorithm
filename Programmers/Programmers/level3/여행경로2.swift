//
//  여행경로2.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/18.
//

import Foundation

func solution2(tickets: [[String]]) -> [String] {
    let tickets = tickets.sorted(by: { $0[1] < $1[1] })
    var ans: [String] = []
    var visited = Array(repeating: false, count: tickets.count)
    
    func dfs(_ start: String) {
        if tickets.count == ans.count {
            ans.append(start)
            return
        }
        
        for i in 0..<tickets.count {
            if !visited[i] && tickets[i][0] == start {
                visited[i] = true
                ans.append(tickets[i][0])
                dfs(tickets[i][1])

                if ans.count == tickets.count + 1 {
                    return
                }
                
                visited[i] = false
                ans.removeLast()
            }
        }
    }
    
    dfs("ICN")
    return ans
}


//func solution2(tickets: [[String]]) -> [String] {
//    let tickets = tickets.sorted(by: { $0[1] < $1[1] })
//    var ans: [String] = []
//    var visited = Array(repeating: false, count: tickets.count)
//
//    func dfs(_ start: String) {
//        if ans.count == tickets.count {
//            ans.append(start)
//            return
//        }
//
//        for i in 0..<tickets.count {
//            if tickets[i][0] == start && !visited[i] {
//                visited[i] = true
//                ans.append(start)
//                bfs(tickets[i][1])
//
//                if ans.count == tickets.count + 1 {
//                    return
//                }
//
//                ans.removeLast()
//                visited[i] = false
//            }
//        }
//    }
//
//    dfs("ICN")
//
//    return ans
//}
