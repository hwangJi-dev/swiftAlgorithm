//
//  큰 수 만들기.swift
//  Programmers1
//
//  Created by hwangJi on 2022/09/20.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let number = Array(number).map{ String($0) }
    var maxIndex = 0
    var lastIndex = k
    var maxString = ""
    
    // [1️⃣] k개수만큼을 제외한 자릿수만큼 반복
    for _ in 0..<number.count - k {
        var maxNumber = "0"
        
        // [🔑 시간 단축 조건]
        // maxIndex와 lastIndex가 같지 않다면 큰 수를 찾아가며 돌지만
        if maxIndex != lastIndex {
            // [2️⃣] maxIndex부터 lastIndex까지 돌며 가장 큰 수 찾기
            for j in maxIndex...lastIndex {
                // [🔑 시간 단축 조건] 1의자리 수 중 가장 큰 수인 9라면 반복문을 다 돌지 않고 탈출
                if number[j] == "9" {
                    maxNumber = number[j]
                    maxIndex = j + 1
                    break
                } else if number[j] > maxNumber {
                    maxNumber = number[j]
                    maxIndex = j + 1
                }
            }
            
            // for문을 다 돌고나면
            // 비교범위 중 가장 큰 수를 찾았단 뜻이므로 maxString에 maxNumber 추가
            maxString += maxNumber
            
            // [비교 범위의 lastIndex 조건]
            // k는 제거하려는 개수이므로 한자리씩 늘려가며 비교범위를 정하기 위해
            // k에 maxString의 count를 더해준다.
            lastIndex = k + maxString.count
        } else {
            // [🔑 시간 단축 조건]
            // maxIndex와 lastIndex가 같다면
            // 남은 number 배열의 수를 모두 maxString에 append해주고 탈출한다.
            for i in maxIndex..<number.count {
                maxString += number[i]
            }
            break
        }
    }
    return maxString
}
