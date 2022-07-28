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

