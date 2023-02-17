//
//  괄호 변환.swift
//  Programmers1
//
//  Created by hwangJi on 2022/09/21.
//

import Foundation

func solution(p: String) -> String {
    var answer = ""
    
    // 1. 입력이 빈 문자열인 경우, 빈 문자열을 반환합니다.
    if p == "" {
        return ""
    }
    
    // 2. 문자열을 두 "균형잡힌 괄호 문자열" u, v로 분리합니다.
    let u = makeBalanceBracket(p)[0]
    let v = makeBalanceBracket(p)[1]
    
    // 3. 문자열 u가 "올바른 괄호 문자열" 이라면
    if checkRightBracket(u) == true {
        // answer에 u를 이어 붙인다.
        answer += u
        if v != "" {
            // 문자열 v에 대해 1단계부터 다시 수행합니다.
            // 3-1. 수행한 결과 문자열을 u에 이어 붙인 후 반환합니다.
            return answer + solution(v)
        }
    } else {
        // 문자열 u가 "올바른 괄호 문자열"이 아닐 때
        // ✅ 4번 과정 수행
        answer += fixToRightBracket(u, v)
    }
    
    return answer
}

// MARK: - 문자열을 "균형잡힌 괄호 문자열"로 분리하여 return하는 함수
func makeBalanceBracket(_ p: String) -> [String] {
    var sum = 0
    var splitIndex = 0
    let bracket = Array(p).map { String($0) }
    
    for (index, bracket) in bracket.enumerated() {
        sum += bracket == "(" ? -1 : 1
        
        if sum == 0 {
            splitIndex = index
            break
        }
    }
    
    var u = ""
    var v = ""
    
    if splitIndex < p.count {
        u = String(p[String.Index(utf16Offset: 0, in: p)...String.Index(utf16Offset: splitIndex, in: p)])
        v = String(p[String.Index(utf16Offset: splitIndex + 1, in: p)..<p.endIndex])
    }
    
    return [u, v]
}

// MARK: - "올바른 괄호 문자열"인지 판별하는 함수
func checkRightBracket(_ p: String) -> Bool {
    var sum = 0
    let bracket = Array(p).map { String($0) }
    
    for i in bracket {
        if sum == 0 && i == ")" {
            return false
        }
        sum += i == "(" ? -1 : 1
    }
    
    return sum != 0 ? false : true
}

// MARK: - 문자열이 "올바른 괄호 문자열"이 아닐 때 수행되는 fix 함수
func fixToRightBracket(_ u: String, _ v: String) -> String {
    var u = Array(u).map { String($0) }
    
    // 4-1. 빈 문자열에 첫 번째 문자로 '('를 붙입니다.
    var bracket = "("
    
    // 4-2. 문자열 v에 대해 1단계부터 재귀적으로 수행한 결과 문자열을 이어 붙입니다.
    bracket += solution(v)
    
    // 4-3. ')'를 다시 붙입니다.
    bracket += ")"
    
    // 4-4. u의 첫 번째와 마지막 문자를 제거하고,
    u.removeFirst()
    u.removeLast()
    
    // 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙입니다.
    for i in u {
        bracket += i == "(" ? ")" : "("
    }
    
    // 4-5. 생성된 문자열을 반환합니다.
    return bracket
}
