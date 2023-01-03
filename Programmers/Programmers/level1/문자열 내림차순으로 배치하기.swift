//
//  문자열 내림차순으로 배치하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/04.
//

import Foundation

func solution1(s:String) -> String {
    return s.sorted(by: >).map{ String($0) }.joined()
}
