//
//  조이스틱.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/04.
//

import Foundation

func solution(name:String) -> Int {
    let abcDict: [String: Int] = ["B": 1, "C": 2, "D": 3, "E": 4, "F": 5, "G": 6, "H": 7, "I": 8, "J": 9, "K": 10, "L": 11, "M": 12, "N": 13, "O": 12, "P": 11, "Q": 10, "R": 9, "S": 8, "T": 7, "U": 6, "V": 5, "W": 4, "X": 3, "Y": 2, "Z": 1]
    let name = name.map({ String($0) })
    var initialName = Array(repeating: "A", count: name.count)
    var ans = 0
    var res = Int.max
    
    if name[0] != "A" {
        ans += abcDict[name[0]]!
        initialName[0] = name[0]
    }
    
    func dfs(_ initialName: [String], _ count: Int, _ cursor: Int) {
        if initialName == name {
            res = min(res, count)
            return
        }
        
        // left
        var rightName = initialName
        var rightCount = count
        let right = joystickMovesLeftorRight(true, cursor, name, initialName)
        rightName[right[0]] = name[right[0]]
        rightCount += abcDict[name[right[0]]]!
        rightCount += right[1]
        dfs(rightName, rightCount, right[0])
        
        var leftName = initialName
        var leftCount = count
        let left = joystickMovesLeftorRight(false, cursor, name, initialName)
        leftName[left[0]] = name[left[0]]
        leftCount += abcDict[name[left[0]]]!
        leftCount += left[1]
        dfs(leftName, leftCount, left[0])
    }
    
    dfs(initialName, ans, 0)
    return res
}

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
