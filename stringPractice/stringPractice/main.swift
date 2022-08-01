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

// 💜 문자열 구간일치 여부
// hasPrefix: 문자의 앞에서부터 검색하여 일치 여부 반환
// hasSuffix: 문자의 뒤에서부터 검색하여 일치 여부 반환
// contains: 일부 문자를 포함하는지 여부 반환
var jobsArray = ["변호사", "의사", "교사", "교수", "개발자", "디자이너", "기획자", "작가"]

for job in jobsArray {
    if job.hasPrefix("교") {
        print("--hasPrefix--", job)
    }
    
    if job.hasSuffix("사") {
        print("--hasSuffix--", job)
    }
    
    if job.contains("자") {
        print("--contains--", job)
    }
}

// 💜 컬렉션(배열)에서 지정된 하위 범위의 요소 제거
// removeSubrange(_:)

// Range -> ..< 와 같은 half-open range 연산자를 사용하여 Range 인스턴스를 만들 수 있음
// index(_:offsetBy:) -> 주어진 인덱스로부터 지정된 거리에 있는 인덱스를 반환
var rangeString = "안녕하세요 저는 인덱스 스트링입니다.~"
let range = rangeString.index(rangeString.startIndex, offsetBy: 5)..<rangeString.endIndex // 범위: 시작지점부터 5 오프셋 떨어진 지점부터 endIndex 까지
rangeString.removeSubrange(range)

print("--removeSubrange--", rangeString)
