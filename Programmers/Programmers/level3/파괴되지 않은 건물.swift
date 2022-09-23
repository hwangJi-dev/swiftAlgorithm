//
//  파괴되지 않은 건물.swift
//  Programmers1
//
//  Created by hwangJi on 2022/09/24.
//

import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    let board = board
    
    // 누적합을 수행하기 위한  행 + 1, 열 + 1만큼의 행과 열을 가지는 2차원 보드 생성
    var degreeBoard = Array(repeating: Array(repeating: 0, count: board[0].count + 1), count: board.count + 1)
    
    for skill in skill {
        updateBoardByDegree(&degreeBoard, skill)
    }
    
    addhorizontal(&degreeBoard)
    addVertical(&degreeBoard)
    
    var count = 0
    for row in 0..<board.count {
        for column in 0..<board[0].count {
            degreeBoard[row][column] += board[row][column]
            if degreeBoard[row][column] >= 1 {
                count += 1
            }
        }
    }
    
    return count
}

// MARK: - skill의 degree에 따라 누적합 보드를 업데이트하는 메서드
func updateBoardByDegree(_ board: inout [[Int]], _ skill: [Int]) {
    let type = skill[0]
    let r1 = skill[1]
    let c1 = skill[2]
    let r2 = skill[3]
    let c2 = skill[4]
    let degree = type == 1 ? -skill[5] : skill[5]
    
    board[r1][c1] += degree
    board[r1][c2 + 1] -= degree
    board[r2 + 1][c1] -= degree
    board[r2 + 1][c2 + 1] += degree
}

// MARK: - 가로 누적합 메서드
func addhorizontal(_ board: inout [[Int]]) {
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            if j + 1 < board[i].count {
                board[i][j + 1] += board[i][j]
            }
        }
    }
}

// MARK: - 세로 누적합 메서드
func addVertical(_ board: inout [[Int]]) {
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            if j + 1 < board.count {
                board[j + 1][i] += board[j][i]
            }
        }
    }
}
