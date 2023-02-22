//
//  스킬트리.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/22.
//

import Foundation

func solution(skill:String, skill_trees:[String]) -> Int {
    var sum = 0
    
    for tree in skill_trees {
        var preSkillset = Array(skill).map{ String($0) }
        var targetSkill = preSkillset.removeFirst()
        var available = true
        
        for currentSkill in tree {
            if preSkillset.contains(String(currentSkill)) {
                available = false
                break
            }
            
            if String(currentSkill) == targetSkill && preSkillset.count > 0 {
                targetSkill = preSkillset.removeFirst()
            }
        }
        
        sum += available ? 1 : 0
    }
    
    return sum
}
