//
//  가장 큰 정사각형 찾기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/04.
//

import Foundation

func solution(board:[[Int]]) -> Int {
    var sqareCheckBoard = board
    var maxWidth = 0
    
    for i in 1..<board.count {
        for j in 1..<board[0].count {
            if board[i][j] == 1 {
                sqareCheckBoard[i][j] = min(sqareCheckBoard[i-1][j-1], sqareCheckBoard[i-1][j], sqareCheckBoard[i][j-1]) + 1
                if maxWidth < sqareCheckBoard[i][j] {
                    maxWidth = sqareCheckBoard[i][j]
                }
            }
        }
    }
    
    if board.count == 1 || board[0].count == 1 {
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if maxWidth < sqareCheckBoard[i][j] {
                    maxWidth = sqareCheckBoard[i][j]
                }
            }
        }
    }
    
    return maxWidth * maxWidth
}
