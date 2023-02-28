//
//  [3차] 방금그곡.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/27.
//

import Foundation

@available(macOS 13.0, *)
func solution(m:String, musicinfos:[String]) -> String {
    var answerDict: [Int: [String]] = [:]
    
    for musicinfo in musicinfos {
        let musicInfo = musicinfo.components(separatedBy: ",").map({ String($0) })
        let playedMinute = calMinute(musicInfo[0], musicInfo[1])
        let playedSyllable = calSyllable(playedMinute, convertSyllabletoArr(musicInfo[3]))
        
        if playedSyllable.joined().contains(convertSyllabletoArr(m).joined()) {
            if answerDict[playedMinute] == nil {
                answerDict[playedMinute] = [musicInfo[2]]
            } else {
                answerDict[playedMinute]?.append(musicInfo[2])
            }
        }
    }
    
    if answerDict.isEmpty {
        return "(None)"
    } else {
        return answerDict.sorted(by: { $0.key > $1.key })[0].value[0]
    }
}

// 재생시간 계산 메서드
func calMinute(_ start: String, _ end: String) -> Int {
    let start = Int(start.replacingOccurrences(of: ":", with: "")) ?? 0
    let end = Int(end.replacingOccurrences(of: ":", with: "")) ?? 0
    
    if start / 100 < end / 100 {
        return (60 - (start % 100)) + ((end / 100 - start / 100 - 1) * 60) + (end % 100)
    } else {
        return (((end - start) / 100) * 60) + ((end - start) % 100)
    }
}

// C, C#을 정확하게 구분하여 표현하기 위해 #음계를 소문자로 변환하고 Array로 변환하는 메서드
func convertSyllabletoArr(_ syllable: String) -> [String] {
    var syllableArr = Array(syllable).map({ String($0) })
    for (idx, s) in syllableArr.enumerated() {
        if s == "#" {
            syllableArr[idx - 1] = syllableArr[idx - 1].lowercased()
        }
    }
    return syllableArr.filter({ $0 != "#" })
}

// 총 재생된 음계 계산 메서드
func calSyllable(_ minute: Int, _ syllable: [String]) -> [String] {
    return Array(repeatElement(syllable, count: minute / syllable.count)).flatMap{ $0 } + syllable[0..<minute % syllable.count]
}
