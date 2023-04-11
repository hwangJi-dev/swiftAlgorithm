//
//  [1차] 셔틀버스.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/11.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var startTime = 900
    var cornTime = startTime
    var timetable = timetable.map({ Int($0.split(separator: ":").joined())! }).filter({ $0 != 2359 }).sorted(by: >)
    var tada = 0
    
    for i in 1...n {
        var m = m
        
        while m > 0 && !timetable.isEmpty {
            tada = timetable.popLast()!

            if tada <= startTime {
                m -= 1
            } else {
                timetable.append(tada)
                tada = startTime
                break
            }
        }
        
        if n == i {
            if m > 0 {
                cornTime = startTime > tada ? startTime : tada
            } else {
                cornTime = tada - 1
                if cornTime % 100 >= 60 {
                    cornTime -= 40
                }
            }
        }
        
        startTime += t
        
        if startTime % 100 >= 60 {
            startTime += 40
        }
    }
    
    return String(format: "%02d:%02d", cornTime / 100, cornTime % 100)
}
