//
//  핸드폰 번호 가리기.swift
//  Programmers1
//
//  Created by hwangJi on 2023/01/19.
//

import Foundation

func solution(phone_number:String) -> String {
    return String(repeating: "*", count: phone_number.count - 4) + phone_number.suffix(4)
}
