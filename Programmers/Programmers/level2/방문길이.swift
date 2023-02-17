//
//  방문길이.swift
//  Programmers1
//
//  Created by hwangJi on 2022/12/31.
//

import Foundation

func solution(dirs: String) -> Int {
    var board: [[Bool]] = Array(repeating: Array(repeating: false, count: 21), count: 21)
    let dirDict: [String: Int] = ["U": 1, "R": 0, "D": 1, "L": 0]
    var departure = [10, 10], visitLine = [10, 10]
    var result = 0
    
    for i in dirs {
        let s = dirDict[String(i)]!
        
        if i == "U" || i == "R" {
            if departure[s] + 2 <= 20 {
                visitLine = departure
                departure[s] += 2
                visitLine[s] += 1
            }
        } else {
            if departure[s] - 2 >= 0 {
                visitLine = departure
                departure[s] -= 2
                visitLine[s] -= 1
            }
        }
        
        result += board[visitLine[0]][visitLine[1]] == false ? 1 : 0
        board[visitLine[0]][visitLine[1]] = true
    }
    
    return result
}
