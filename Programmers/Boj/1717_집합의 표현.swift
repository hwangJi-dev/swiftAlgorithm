//
//  1717_집합의 표현.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/26.
//

import Foundation

func solution1717() {
    let nm = readLine()!.components(separatedBy: .whitespaces).map({ Int($0)! })
    var parent = [Int](0...nm[0])
    
    func find(_ b: Int) -> Int {
        if b != parent[b] {
            parent[b] = find(parent[b])
        }
        return parent[b]
    }
    
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        
        if a >= b {
            parent[a] = b
        } else {
            parent[b] = a
        }
    }
    
    for _ in 1...nm[1] {
        let cal = readLine()!.components(separatedBy: .whitespaces).map({ Int($0)! })
        let a = cal[1]
        let b = cal[2]
        
        if cal[0] == 0 {
            union(a, b)
        } else {
            if find(a) == find(b) {
                print("YES")
            } else {
                print("NO")
            }
        }
    }
}
