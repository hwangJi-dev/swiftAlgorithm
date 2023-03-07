//
//  혼자서 하는 틱택토.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/07.
//

import Foundation

func solution(board:[String]) -> Int {
    var oxCount = (0,0)
    var oBoard: [Int] = []
    var xBoard: [Int] = []
    var isOXEnd = (false, false)
    let bingoArr = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]
    
    for (bdx, b) in board.enumerated() {
        for (tdx, t) in b.enumerated() {
            if t == "O" {
                oxCount.0 += 1
                oBoard.append((bdx * 3) + tdx)
            } else if t == "X" {
                oxCount.1 += 1
                xBoard.append((bdx * 3) + tdx)
            }
            
            if oBoard.count >= 3 {
                for a in bingoArr {
                    if oBoard.count - oBoard.filter({ !a.contains($0) }).count == 3 {
                        isOXEnd.0 = true
                        break
                    }
                }
            }
            
            if xBoard.count >= 3 {
                for a in bingoArr {
                    if xBoard.count - xBoard.filter({ !a.contains($0) }).count == 3 {
                        isOXEnd.1 = true
                        break
                    }
                }
            }
        }
    }
    
    // 조건 판별
    return oxCount.0 < oxCount.1 || oxCount.0 > oxCount.1 + 1 || (oxCount.0 <= oxCount.1 && isOXEnd.0) || (oxCount.0 > oxCount.1 && isOXEnd.1) ? 0 : 1
}
