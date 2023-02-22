//
//  스킬트리.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/22.
//

import Foundation

func solution(skill:String, skill_trees:[String]) -> Int {
    var sum = 0
    
    for i in skill_trees {
        var skill = Array(skill).map{ String($0) }
        var target = skill.removeFirst()
        var available = true
        
        for s in i {
            if skill.contains(String(s)) {
                available = false
                break
            }
            
            if String(s) == target && skill.count > 0 {
                target = skill.removeFirst()
            }
        }
        
        sum += available ? 1 : 0
    }
    
    return sum
}
