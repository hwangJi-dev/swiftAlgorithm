//
//  크레인 인형뽑기 게임.swift
//  ProgrammersLevel1
//
//  Created by hwangJi on 2022/08/02.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var gameBoard: [[Int]] = board
    var stack: [Int] = []
    var count: Int = 0
    
    for i in moves {
        for j in 0..<gameBoard.count {
            if gameBoard[j][i - 1] != 0 {
                if stack.last == gameBoard[j][i - 1] {
                    stack.removeLast()
                    count += 1
                } else {
                    stack.append(gameBoard[j][i - 1])
                }
                gameBoard[j][i - 1] = 0
                break
            }
        }
    }
    
    return count * 2
}
