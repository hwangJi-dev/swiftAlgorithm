//
//  문자열 내 마음대로 정렬하기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/03.
//

import Foundation

func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted().sorted(by: { Array($0)[n] < Array($1)[n] })
}
