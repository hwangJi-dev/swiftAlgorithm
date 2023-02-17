//
//  햄버거 만들기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/11.
//

import Foundation

@available(macOS 13.0, *)
func solution(ingredient:[Int]) -> Int {
    var ingredient = ingredient
    var result = 0
    var hamburger: [Int] = []
    
    for i in 0..<ingredient.count {
        hamburger.append(ingredient[i])
        
        if hamburger.count >= 4 {
            let index = hamburger.count - 1
            if hamburger[index] == 1 && hamburger[index - 1] == 3 && hamburger[index - 2] == 2 && hamburger[index - 3] == 1 {
                result += 1
                hamburger.removeSubrange(hamburger.count - 4...hamburger.count - 1)
            }
        }
    }
    
    return result
}
