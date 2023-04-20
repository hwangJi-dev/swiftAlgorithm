//
//  5430_AC.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/21.
//

import Foundation

func solution5430() {
    let t = Int(readLine()!)!
    
outloop: for _ in 0..<t {
        let function = readLine()!
        let n = Int(readLine()!)!
        let arr = readLine()!.trimmingCharacters(in: ["[", "]"]).split(separator: ",").map({ Int(String($0))! })
        var pointer = 0
        var reversepointer = n - 1
        var isReverse = false
    
        for i in function {
            if i == "R" {
                isReverse = !isReverse
            } else {
                if pointer > reversepointer {
                    print("error")
                    continue outloop
                }
                
                if isReverse {
                    reversepointer -= 1
                } else {
                    pointer += 1
                }
            }
        }
        
        if pointer > reversepointer {
            print("[]")
        } else {
            var ans = arr[pointer...reversepointer]
            if isReverse {
                ans.reverse()
            }
            print("[" + ans.map({ String($0) }).joined(separator: ",") + "]")
        }
    }
}
