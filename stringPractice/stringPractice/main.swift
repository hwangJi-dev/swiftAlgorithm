//
//  main.swift
//  stringPractice
//
//  Created by hwangJi on 2022/07/29.
//

import Foundation

let originString = "Hello, World!"

// π replacingOccurrences(of:with:) -> λ¬Έμμ΄ μΉν
// of: target(μΉνν  λμ) / with: replacement(μΉνλ  λ¬Έμ)
var replaceString = originString.replacingOccurrences(of: "Hello", with: "Hi")
print("--replaceString--", replaceString)

// π trimmingCharacters(in:) -> μ£Όμ΄μ§ λ¬Έμ μ§ν©μ ν¬ν¨λ λ¬Έμλ₯Ό μμ μ λ¬Έμμ "μλμμ" μ κ±°ν¨
// in: set(μλμμ μ κ±°λ  λ¬Έμ μ§ν©)
var removeFirstAndLastString = originString.trimmingCharacters(in: ["H", ".", "!"])
print("--trimmingCharacters--", removeFirstAndLastString)

// π λ¬Έμμ΄ κ΅¬κ°μΌμΉ μ¬λΆ
// hasPrefix: λ¬Έμμ μμμλΆν° κ²μνμ¬ μΌμΉ μ¬λΆ λ°ν
// hasSuffix: λ¬Έμμ λ€μμλΆν° κ²μνμ¬ μΌμΉ μ¬λΆ λ°ν
// contains: μΌλΆ λ¬Έμλ₯Ό ν¬ν¨νλμ§ μ¬λΆ λ°ν
let jobsArray = ["λ³νΈμ¬", "μμ¬", "κ΅μ¬", "κ΅μ", "κ°λ°μ", "λμμ΄λ", "κΈ°νμ", "μκ°"]

for job in jobsArray {
    if job.hasPrefix("κ΅") {
        print("--hasPrefix--", job)
    }
    
    if job.hasSuffix("μ¬") {
        print("--hasSuffix--", job)
    }
    
    if job.contains("μ") {
        print("--contains--", job)
    }
}


