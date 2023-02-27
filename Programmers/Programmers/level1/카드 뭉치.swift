//
//  카드 뭉치.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/27.
//

import Foundation

func solution(cards1:[String], cards2:[String], goal:[String]) -> String {
    var cards1 = cards1.reversed().map({ String($0) })
    var cards2 = cards2.reversed().map({ String($0) })
    var target1 = cards1.popLast()
    var target2 = cards2.popLast()
    
    for g in goal {
        if g == target1 {
            target1 = cards1.popLast()
        } else if g == target2 {
            target2 = cards2.popLast()
        } else {
            return "No"
        }
    }
    
    return "Yes"
}
