//
//  모의고사.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/05.
//

import Foundation

func solution(answers:[Int]) -> [Int] {
    let supoza1 = [1, 2, 3, 4, 5]
    let supoza2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let supoza3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    var dict: [Int: Int] = [1: 0, 2: 0, 3: 0]
    
    for (index, answer) in answers.enumerated() {
        dict[1] = supoza1[index % 5] == answer ? dict[1]! + 1 : dict[1]
        dict[2] = supoza2[index % 8] == answer ? dict[2]! + 1 : dict[2]
        dict[3] = supoza3[index % 10] == answer ? dict[3]! + 1 : dict[3]
    }
    
    return dict.filter({ $0.value == dict.values.max() }).keys.sorted()
}
