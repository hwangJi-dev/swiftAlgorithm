//
//  과제 진행하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/31.
//

import Foundation

struct Homework {
    var name: String
    var startHour: Int
    var startMinute: Int
    var playTime: Int
}

func solution(plans:[[String]]) -> [String] {
    var homework: [Homework] = []
    
    for i in plans {
        let time = i[1].components(separatedBy: ":").map({ Int($0)! })
        homework.append(Homework(name: i[0], startHour: time[0], startMinute: time[1], playTime: Int(i[2])!))
    }
    
    // 정렬
    homework = homework.sorted(by: { getTotalTime($0.startHour, $0.startMinute) > getTotalTime($1.startHour, $1.startMinute) })
   
    var hwStack: [Homework] = [homework.removeLast()]
    var currentHour: Int = hwStack[0].startHour
    var currentMinute: Int = hwStack[0].startMinute
    var ans: [String] = []
    
    while !hwStack.isEmpty {
        if var nowHW = hwStack.popLast() {
            nowHW.startHour = currentHour
            nowHW.startMinute = currentMinute
            
            if let nextHW = homework.last {
                // 과제 진행 중 새 과제를 해야한다면
                if getTotalTime(currentHour, currentMinute, nowHW.playTime) > getTotalTime(nextHW.startHour, nextHW.startMinute) {
                    nowHW.playTime = nowHW.playTime - getIntervalTime(currentHour, currentMinute, nextHW.startHour, nextHW.startMinute)
                    hwStack.append(nowHW)
                    removeLastHomework(nextHW)
                } else {
                    // 현재 과제가 마무리되었을 때
                    ans.append(nowHW.name)
                    let doneTime = getDoneHomeworkTime(currentHour, currentMinute, nowHW.playTime)
                    currentHour = doneTime[0]
                    currentMinute = doneTime[1]
                    
                    // 만약 하던 과제가 없지만 새로 해야하는 과제가 남아있다면
                    if hwStack.isEmpty && !homework.isEmpty {
                        removeLastHomework(nextHW)
                    }
                }
            } else {
                ans.append(nowHW.name)
            }
        }
    }
    
    func removeLastHomework(_ nextHW: Homework) {
        hwStack.append(homework.removeLast())
        currentHour = nextHW.startHour
        currentMinute = nextHW.startMinute
    }
    
    return ans
}

// 총 시간을 구하는 메서드
func getTotalTime(_ startH: Int, _ startM: Int, _ playTime: Int? = nil) -> Int {
    if let playTime = playTime {
        if playTime + startM > 60 {
            return (startH + ((playTime + startM) / 60)) * 60 + ((playTime + startM) % 60)
        } else {
            return (startH * 60) + playTime + startM
        }
    }
    return startH * 60 + startM
}

// 시간 차를 구하는 메서드
func getIntervalTime(_ startH: Int, _ startM: Int, _ endH: Int, _ endM: Int) -> Int {
    if startH < endH {
        return (60 - startM) + (endH - (startH + 1)) + endM
    } else {
        return endM - startM
    }
}

func getDoneHomeworkTime(_ startH: Int, _ startM: Int, _ playTime: Int) -> [Int] {
    if startM + playTime > 60 {
        return [startH + ((playTime + startM) / 60), (playTime + startM) % 60]
    } else {
        return [startH, playTime + startM]
    }
}
