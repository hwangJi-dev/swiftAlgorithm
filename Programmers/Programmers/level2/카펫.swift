//
//  카펫.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/13.
//

import Foundation

func solution(brown:Int, yellow:Int) -> [Int] {
    var res: [Int] = []
    
    if yellow == 1 {
        return [3, 3]
    }
    
    for i in 1...yellow / 2 + 1 {
        if yellow % i == 0 {
            let yx = yellow / i
            
            if (yx * 2) + (i * 2) + 4 == brown {
                res = [yx + 2, i + 2]
                break
            }
        }
    }
    
    return res
}
