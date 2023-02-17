//
//  전광판.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/17.
//

import Foundation

func solution_softeer1() {
    let testcase = Int(readLine()!)!
    var arr: [[String]] = []
    let dict: [String: [Int]] = ["-1": [], "0": [0, 1, 3, 4, 5, 6], "1": [1, 3], "2": [0, 1 ,2, 4, 5], "3": [0, 1, 2, 3, 4], "4": [1, 2, 3, 6], "5": [0, 2, 3, 4, 6], "6": [0, 2, 3, 4, 5, 6], "7": [0, 1, 3, 6], "8": [0, 1, 2, 3, 4, 5, 6], "9": [0, 1, 2, 3, 4, 6]]
    
    for _ in 0...testcase - 1 {
        let n = readLine()?.components(separatedBy: .whitespaces)
        arr.append(n!)
    }
    
    for i in arr {
        // 로직 수행
        var a = i[0].map{ String($0) }
        var b = i[1].map{ String($0) }
        
        var result = 0
        for _ in 0..<max(a.count, b.count) {
            let popA = a.popLast() ?? "-1"
            let popB = b.popLast() ?? "-1"
            result += dict[popB]!.filter({ !(dict[popA]?.contains($0))! }).count + dict[popA]!.filter({ !(dict[popB]?.contains($0))! }).count
        }
        print(result)
    }
}
