//
//  조이스틱.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/04.
//

import Foundation

func solution(name:String) -> Int {
    var abcDict: [String: Int] = [:]
    let name = name.map({ String($0) })
    var initialName = Array(repeating: "A", count: name.count)
    var res = Int.max
    
    for i in 1...26 {
        if let scalar = Unicode.Scalar(64 + i) {
            if i <= 14 {
                abcDict[scalar.description] = i - 1
            } else {
                abcDict[scalar.description] = abs(i - 26) + 1
            }
        }
    }
    
    //"A": 0, B": 1, "C": 2, "D": 3, "E": 4, "F": 5, "G": 6, "H": 7, "I": 8, "J": 9, "K": 10, "L": 11, "M": 12, "N": 13, "O": 12, "P": 11, "Q": 10, "R": 9, "S": 8, "T": 7, "U": 6, "V": 5, "W": 4, "X": 3, "Y": 2, "Z": 1
    
    if name[0] != "A" {
        initialName[0] = name[0]
    }
    
    /// dfs
    func dfs(_ initialName: [String], _ count: Int, _ cursor: Int) {
        if initialName == name {
            res = min(res, count)
            return
        }
        
        // right
        let right = joystickMovesLeftorRight(true, cursor, name, initialName)
        var rightName = initialName
        var rightCount = count
        rightName[right[0]] = name[right[0]]
        rightCount += abcDict[name[right[0]]]! + right[1]
        dfs(rightName, rightCount, right[0])
        
        // left
        let left = joystickMovesLeftorRight(false, cursor, name, initialName)
        var leftName = initialName
        var leftCount = count
        leftName[left[0]] = name[left[0]]
        leftCount += abcDict[name[left[0]]]! + left[1]
        dfs(leftName, leftCount, left[0])
    }
    
    dfs(initialName, 0, 0)
    return name[0] != "A" ? res + abcDict[name[0]]! : res
}

// MARK: - 조이스틱 좌/우로 이동 후 커서와 이동횟수를 반환하는 메서드
func joystickMovesLeftorRight(_ isRight: Bool, _ cursor: Int, _ name: [String], _ initialName: [String]) -> [Int] {
    var cursor = cursor
    var moves = 0
    
    for _ in name {
        cursor = isRight ? cursor + 1 : cursor - 1
        moves += 1
        
        if cursor > name.count - 1 {
            cursor = 0
        }
        
        if cursor < 0 {
            cursor = name.count - 1
        }
        
        if name[cursor] != "A" && initialName[cursor] == "A" {
            break
        }
    }
    
    return [cursor, moves]
}
