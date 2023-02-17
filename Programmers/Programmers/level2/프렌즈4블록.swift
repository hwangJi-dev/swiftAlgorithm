//
//  프렌즈4블록.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/17.
//

import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var boardArr: [[String]] = Array(repeating: Array(repeating: "", count: m), count: n)
    var result = 0
    var isBreak = Array(repeating: false, count: m)
    var point: Set<[Int]> = []
    
    for i in 0...board.count - 1 {
        let k = Array(board.reversed()[i]).map({ String($0) })
        for j in 0...k.count - 1 {
            boardArr[j][i] = k[j]
        }
    }
    
    isBreak[0] = true
    
    while isBreak.contains(true) {
        for i in 0...m - 2 {
            var breakArr = Array(repeating: false, count: n)
            for j in 0...n - 2 {
                if boardArr[j][i] == boardArr[j][i + 1] && boardArr[j][i + 1] == boardArr[j + 1][i + 1] && boardArr[j][i + 1] == boardArr[j + 1][i] && boardArr[j][i] != "" && boardArr[j][i].allSatisfy({ $0.isUppercase }) {
                    point.insert([j, i])
                    point.insert([j, i + 1])
                    point.insert([j + 1, i + 1])
                    point.insert([j + 1, i])
                    breakArr[j] = true
                } else {
                    breakArr[j] = false
                }
            }
            
            if breakArr.contains(true) {
                isBreak[i] = true
            } else {
                isBreak[i] = false
            }
        }
        
        if !point.isEmpty {
            for k in point.sorted(by: { $0[0] < $1[0] }) {
                boardArr[k[0]][k[1]] = "-"
            }
        }
        
        for (index, l) in boardArr.enumerated() {
            boardArr[index] = l.filter({ $0 != "-" })
            if boardArr[index].count < m {
                for _ in 1...m - boardArr[index].count {
                    boardArr[index].append("")
                }
            }
        }
        
        result += point.count
        point.removeAll()
    }
    
    return result
}
