//
//  뒤에 있는 큰 수 찾기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/01.
//

import Foundation

func solution2(numbers:[Int]) -> [Int] {
    var ans = Array(repeating: -1, count: numbers.count)
    var stack: [(Int, Int)] = [(0, numbers[0])] // 인덱스를 같이 저장하기 위해 튜플 형태로 저장
    
    for i in 1..<numbers.count {
        // stack이 비어있지 않으면서
        // stack의 마지막 value가 기준값보다 작을때까지 반복
        while !stack.isEmpty {
            if stack.last!.1 >= numbers[i] { break }
            // stack의 마지막원소를 지우고 해당 인덱스에 큰 수 할당
            ans[stack.removeLast().0] = numbers[i]
        }
        // stack에 현재 기준값 저장
        stack.append((i, numbers[i]))
    }
    
    return ans
}
