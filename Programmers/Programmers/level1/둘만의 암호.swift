//
//  둘만의 암호.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/03.
//

import Foundation

func solution(s:String, skip:String, index:Int) -> String {
    let abc = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"].filter{ !skip.contains($0) }
    var ans = ""
    
    for i in s {
        var idx = (abc.firstIndex(of: String(i))! + index) % abc.count
        idx = idx > abc.count - 1 ? idx - abc.count : idx
        ans += abc[idx]
    }
    
    return ans
}
