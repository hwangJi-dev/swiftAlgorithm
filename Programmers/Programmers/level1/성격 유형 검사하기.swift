//
//  성격 유형 검사하기.swift
//  Programmers1
//
//  Created by hwangJi on 2022/09/05.
//

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var testArr: String = ""
    
    for i in 0...survey.count - 1 {
        let charSurvey = Array(survey[i])
        let score = calByChoice(choice: choices[i])
        
        if choices[i] < 4 {
            for _ in 0...score - 1 {
                testArr += String(charSurvey[0])
            }
        } else if choices[i] > 4 {
            for _ in 0...score - 1 {
                testArr += String(charSurvey[1])
            }
        }
    }
    
    return makePersonalityResult(testArr)
}

func calByChoice(choice: Int) -> Int {
    switch choice {
        case 1, 7:
            return 3
        case 2, 6:
            return 2
        case 3, 5:
            return 1
        default:
            return 0
    }
}

// 알파벳순 return
func makePersonalityResult(_ resultArr: String) -> String {
    var finalResult: String = ""
    // 1. R과 T 비교
    let Rchoice = filterPersonality(resultArr, "R")
    let Tchoice = filterPersonality(resultArr, "T")

    finalResult += Rchoice >= Tchoice ? "R" : "T"
    
    // 2. C과 F 비교
    let Cchoice = filterPersonality(resultArr, "C")
    let Fchoice = filterPersonality(resultArr, "F")

    finalResult += Cchoice >= Fchoice ? "C" : "F"
    
    // 3. J과 M 비교
    let Jchoice = filterPersonality(resultArr, "J")
    let Mchoice = filterPersonality(resultArr, "M")

    finalResult += Jchoice >= Mchoice ? "J" : "M"
    
    // 4. A과 N 비교
    let Achoice = filterPersonality(resultArr, "A")
    let Nchoice = filterPersonality(resultArr, "N")

    finalResult += Achoice >= Nchoice ? "A" : "N"
    
    return finalResult
}

func filterPersonality(_ resultArr: String, _ personailty: String) -> Int {
    return resultArr.components(separatedBy: personailty).count - 1
}
