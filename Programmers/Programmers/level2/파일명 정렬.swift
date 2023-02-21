//
//  파일명 정렬.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/21.
//

import Foundation

func solution(files:[String]) -> [String] {
    var arr: [(String, Int, Int, String)] = []
    var res: [String] = []
    
    for (index, file) in files.enumerated() {
        let HEAD = file.prefix{ !$0.isNumber }.lowercased()
        let NUMBER = file.drop{ !$0.isNumber }.prefix(while: { $0.isNumber }).prefix(5)
        
        arr.append((HEAD, Int(NUMBER) ?? 0, index, file))
    }
    
    arr = arr.sorted(by: {
        if $0.0 != $1.0 { return $0.0 < $1.0 }
        if $0.1 != $1.1 { return $0.1 < $1.1 }
        return $0.2 < $1.2
    })
    
    for i in arr {
        res.append(i.3)
    }

    return res
}
