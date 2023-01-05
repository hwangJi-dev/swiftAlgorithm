//
//  모의고사.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/05.
//

import Foundation

func solution(answers:[Int]) -> [Int] {
    let supoza1 = Array(String(repeating: "12345", count: answers.count % 5 != 0 ? (answers.count / 5) + 1 : (answers.count / 5))).map({ String($0) })
    let supoza2 = Array(String(repeating: "21232425", count: answers.count % 8 != 0 ? (answers.count / 8) + 1 : (answers.count / 8))).map({ String($0) })
    let supoza3 = Array(String(repeating: "3311224455", count: answers.count % 10 != 0 ? (answers.count / 10) + 1 : (answers.count / 10))).map({ String($0) })
    var dict: [Int: Int] = [1: 0, 2: 0, 3: 0]
    
    for (index, answer) in answers.enumerated() {
        dict[1] = supoza1[index] == String(answer) ? dict[1]! + 1 : dict[1]
        dict[2] = supoza2[index] == String(answer) ? dict[2]! + 1 : dict[2]
        dict[3] = supoza3[index] == String(answer) ? dict[3]! + 1 : dict[3]
    }
    
    return dict.filter({ $0.value == dict.values.max() }).keys.sorted()
}
