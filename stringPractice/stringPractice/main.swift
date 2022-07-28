//
//  main.swift
//  stringPractice
//
//  Created by hwangJi on 2022/07/29.
//

import Foundation

let originString = "Hello, World!"

// 💜 replacingOccurrences(of:with:) -> 문자열 치환
// of: target(치환할 대상) / with: replacement(치환될 문자)
var replaceString = originString.replacingOccurrences(of: "Hello", with: "Hi")
print("--replaceString--", replaceString)

// 💜 trimmingCharacters(in:) -> 주어진 문자 집합에 포함된 문자를 수신자 문자의 "양끝에서" 제거함
// in: set(양끝에서 제거될 문자 집합)
var removeFirstAndLastString = originString.trimmingCharacters(in: ["H", ".", "!"])
print("--trimmingCharacters--", removeFirstAndLastString)
