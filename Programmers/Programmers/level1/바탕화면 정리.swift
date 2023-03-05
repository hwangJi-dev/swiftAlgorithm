//
//  바탕화면 정리.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/05.
//

import Foundation

func solution(wallpaper:[String]) -> [Int] {
    var coordinate = [50,50,0,0]
    
    for (idx, i) in wallpaper.enumerated() {
        for (jdx, j) in i.enumerated() {
            if j == "#" {
                coordinate[0] = min(idx, coordinate[0])
                coordinate[1] = min(jdx, coordinate[1])
                coordinate[2] = max(idx + 1, coordinate[2])
                coordinate[3] = max(jdx + 1, coordinate[3])
            }
        }
    }
    
    return coordinate
}
