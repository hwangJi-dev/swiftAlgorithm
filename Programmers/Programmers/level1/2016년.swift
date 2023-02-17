//
//  2016년.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/03.
//

import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    let dayDict: [Int: String] = [3: "SUN", 4: "MON", 5: "TUE", 6: "WED", 0: "THU", 1: "FRI", 2: "SAT"]
    let dayCountArray: [Int] = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var count = 0
    
    for i in 0..<a - 1 {
        count += dayCountArray[i]
    }
    
    return dayDict[(count + b) % 7]!
}
