//
//  16918_봄버맨.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/02.
//

import Foundation

func solution16918() {
    let RCN = readLine()!.split(separator: " ").map({ Int(String($0))! })
    var bombArr: [[String]] = []
    
    for _ in 0..<RCN[0] {
        bombArr.append(Array(readLine()!).map({ String($0) }))
    }
    
    var allBombArr: [[String]] = []
    
    func bomb(x: Int, y: Int) {
        allBombArr[x][y] = "."
        
        if x + 1 <= bombArr.count - 1 {
            allBombArr[x + 1][y] = "."
        }
        
        if x - 1 >= 0 {
            allBombArr[x - 1][y] = "."
        }
        
        if y + 1 <= bombArr[0].count - 1 {
            allBombArr[x][y + 1] = "."
        }
        
        if y - 1 >= 0 {
            allBombArr[x][y - 1] = "."
        }
    }
    
    for _ in stride(from: 1, to: RCN[2], by: 2) {
        allBombArr = Array(repeating: Array(repeating: "O", count: bombArr[0].count), count: bombArr.count)
        
        for (idx, i) in bombArr.enumerated() {
            for (jdx, _) in i.enumerated() {
                if bombArr[idx][jdx] == "O" {
                    bomb(x: idx, y: jdx)
                }
            }
        }

        bombArr = allBombArr
    }
    
    if RCN[2] % 2 == 0 {
        for _ in bombArr {
            print(String(repeating: "O", count: bombArr[0].count))
        }
    } else {
        for i in bombArr {
            print(i.joined())
        }
    }
}
