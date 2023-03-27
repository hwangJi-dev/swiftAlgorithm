//
//  수식 최대화.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/27.
//

import Foundation

func solution(expression:String) -> Int64 {
    let numArr = expression.split(whereSeparator: { $0 == "+" || $0 == "*" || $0 == "-" }).map({ Int($0)! })
    let operArr = expression.split(whereSeparator: { $0.isNumber }).map({ String($0) })
    var maxValue = 0
    let setOperArr = Array(Set(operArr))
    
    // priority 구하기
    let formulaPermutation = permutation(setOperArr, setOperArr.count)
    
    for i in formulaPermutation {
        maxValue = max(maxValue, calbyFormula(i, operArr, numArr))
    }
    
    return Int64(maxValue)
}

// 우선순위 수식 기반으로 값을 계산하는 메서드
func calbyFormula(_ priority: [String], _ operArr: [String], _ numArr: [Int]) -> Int {
    var numArr = numArr
    var operArr = operArr
    
    for i in priority {
        while operArr.contains(String(i)) {
            let idx = operArr.firstIndex(of: String(i)) ?? -1
            
            if i == "*" {
                numArr[idx] = numArr[idx] * numArr[idx + 1]
            } else if i == "+" {
                numArr[idx] = numArr[idx] + numArr[idx + 1]
            } else {
                numArr[idx] = numArr[idx] - numArr[idx + 1]
            }
            
            numArr.remove(at: idx + 1)
            operArr.remove(at: idx)
        }
    }
    
    return abs(numArr[0])
}

// 순열 생성 메서드
func permutation(_ array: [String], _ n: Int) -> Set<[String]> {
    var result = Set<[String]>()
    if array.count < n { return result }

    var visited = Array(repeating: false, count: array.count)

    func cycle(_ now: [String]) {
        if now.count == n {
            result.insert(now)
            return
        }

        for i in 0..<array.count {
            if visited[i] {
                continue
            } else {
                visited[i] = true
                cycle(now + [array[i]])
                visited[i] = false
            }
        }
    }

    cycle([])

    return result
}
