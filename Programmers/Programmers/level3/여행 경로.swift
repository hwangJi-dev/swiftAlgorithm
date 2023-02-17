//
//  여행 경로.swift
//  Programmers1
//
//  Created by hwangJi on 2022/11/30.
//

import Foundation

func solution(_ tickets: [[String]]) -> [String] {
    let tickets = tickets.sorted { $0[1] < $1[1] }
    let visited = [Bool](repeating: false, count: tickets.count)
    return makeTravelRoute(tickets: tickets, currentVisited: [], visited: visited, nextRoute: "ICN")
}

func makeTravelRoute(tickets: [[String]], currentVisited: [String], visited: [Bool], nextRoute: String) -> [String] {
    var currentVisited = currentVisited
    var visited = visited
    if currentVisited.count == tickets.count {
        currentVisited.append(nextRoute)
        return currentVisited
    }
    
    for i in 0..<tickets.count {
        if tickets[i][0] == nextRoute && !visited[i] {
            visited[i] = true
            currentVisited.append(nextRoute)
            currentVisited = makeTravelRoute(tickets: tickets, currentVisited: currentVisited, visited: visited, nextRoute: tickets[i][1])
            
            if currentVisited.count == tickets.count + 1 {
                return currentVisited
            }
            
            currentVisited.removeLast()
            visited[i] = false
        }
    }
    
    return currentVisited
}
