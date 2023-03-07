//
//  혼자서 하는 틱택토.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/07.
//

import Foundation

func solution(board:[String]) -> Int {
    var oCount = 0
    var xCount = 0
    var oBoard: [Int] = []
    var xBoard: [Int] = []
    var isOEnd = false
    var isXEnd = false
    let available = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]
    
    for (bdx, b) in board.enumerated() {
        for (tdx, t) in b.enumerated() {
            if t == "O" {
                oCount += 1
                oBoard.append((bdx * 3) + tdx)
            } else if t == "X" {
                xCount += 1
                xBoard.append((bdx * 3) + tdx)
            }
            
            if oBoard.count >= 3 {
                for a in available {
                    if oBoard.count - oBoard.filter({ !a.contains($0) }).count == 3 {
                        isOEnd = true
                        break
                    }
                }
            }
            
            if xBoard.count >= 3 {
                for a in available {
                    if xBoard.count - xBoard.filter({ !a.contains($0) }).count == 3 {
                        isXEnd = true
                        break
                    }
                }
            }
        }
    }
    
    // 조건 판별
    return oCount < xCount || oCount > xCount + 1 || (oCount <= xCount && isOEnd) || (oCount > xCount && isXEnd) ? 0 : 1
}
