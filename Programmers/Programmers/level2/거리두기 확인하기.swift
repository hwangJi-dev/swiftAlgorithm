//
//  거리두기 확인하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/27.
//

import Foundation

func solution(places:[[String]]) -> [Int] {
    var ans: [Int] = []
    
    for i in places {
        var placeArr: [[String]] = []
        i.forEach({ placeArr.append(Array($0).map({ String($0) })) })
        var isRightDistance = true

        for (iIdx, i) in placeArr.enumerated() {
            for (jIdx, j) in i.enumerated() {
                if j == "P" {
                    if !findIfDiaKeepDistance((iIdx, jIdx), placeArr) || !findIfColKeepDistance((iIdx, jIdx), placeArr) || !findIfRowKeepDistance((iIdx, jIdx), placeArr) {
                        isRightDistance = false
                        break
                    }
                }
            }
        }

        ans.append(isRightDistance ? 1 : 0)
    }
    
    return ans
}

// Row (Int, Int)에서 0: y, 1: x
func findIfRowKeepDistance(_ idx: (Int, Int), _ places: [[String]]) -> Bool {
    // 사이에 X 벽이 있을 수 없음
    if idx.1 + 1 <= 4 {
        if places[idx.0][idx.1 + 1] == "P" { return false }
    }
    
    if idx.1 - 1 >= 0 {
        if places[idx.0][idx.1 - 1] == "P" { return false }
    }
    
    if idx.1 + 2 <= 4 {
        if places[idx.0][idx.1 + 2] == "P" && places[idx.0][idx.1 + 1] != "X" { return false }
    }
    
    if idx.1 - 2 >= 0 {
        if places[idx.0][idx.1 - 2] == "P" && places[idx.0][idx.1 - 1] != "X" { return false }
    }
    
    return true
}

// Column
func findIfColKeepDistance(_ idx: (Int, Int), _ places: [[String]]) -> Bool {
    // 사이에 X 벽이 있을 수 없음
    if idx.0 + 1 <= 4 {
        if places[idx.0 + 1][idx.1] == "P" { return false }
    }
    
    if idx.0 - 1 >= 0 {
        if places[idx.0 - 1][idx.1] == "P" { return false }
    }
    
    if idx.0 + 2 <= 4 {
        if places[idx.0 + 2][idx.1] == "P" && places[idx.0 + 1][idx.1] != "X" { return false }
    }
    
    if idx.0 - 2 >= 0 {
        if places[idx.0 - 2][idx.1] == "P" && places[idx.0 - 1][idx.1] != "X" { return false }
    }
    
    return true
}

// Diagonal
func findIfDiaKeepDistance(_ idx: (Int, Int), _ places: [[String]]) -> Bool {
    if idx.0 + 1 <= 4 && idx.1 + 1 <= 4 {
        if places[idx.0 + 1][idx.1 + 1] == "P" {
            if places[idx.0][idx.1 + 1] != "X" || places[idx.0 + 1][idx.1] != "X" {
                return false
            }
        }
    }
    
    if idx.0 - 1 >= 0 && idx.1 - 1 >= 0 {
        if places[idx.0 - 1][idx.1 - 1] == "P" {
            if places[idx.0 - 1][idx.1] != "X" || places[idx.0][idx.1 - 1] != "X" {
                return false
            }
        }
    }
    
    if idx.0 + 1 <= 4 && idx.1 - 1 >= 0 {
        if places[idx.0 + 1][idx.1 - 1] == "P" {
            if places[idx.0][idx.1 - 1] != "X" || places[idx.0 + 1][idx.1] != "X" {
                return false
            }
        }
    }
    
    if idx.0 - 1 >= 0 && idx.1 + 1 <= 4 {
        if places[idx.0 - 1][idx.1 + 1] == "P" {
            if places[idx.0 - 1][idx.1] != "X" || places[idx.0][idx.1 + 1] != "X" {
                return false
            }
        }
    }
    
    return true
}
