//
//  [1차] 캐시.swift
//  Programmers1
//
//  Created by hwangJi on 2023/03/07.
//

import Foundation

func solution(cacheSize:Int, cities:[String]) -> Int {
    var cache: [String: Int] = [:]
    var res = 0
    
    for city in cities {
        // 도시이름 대소문자 구분 않기 위해 lowercased 처리
        let city = city.lowercased()
        
        // 캐시에 도시이름이 들어있지 않은 경우 - cache miss
        if cache[city] == nil {
            cache[city] = 0
            for c in cache {
                // value(index)가 캐시 크기와 같다면
                if c.value == cacheSize {
                    // 삭제 (가장 최근에 사용되지 않은 항목이므로)
                    cache.removeValue(forKey: c.key)
                } else {
                    // 한칸씩 밀리도록 하기 위해 value에 1 더한다
                    cache[c.key]! += 1
                }
            }
            // cache miss이므로 res에 5 더한다
            res += 5
        } else {
            // 캐시에 도시이름이 들어있는 경우 - cache hit
            // 그 전 인덱스에 있던 도시들의 value를 1씩 더해주고
            for c in cache.sorted(by: { $0.value < $1.value }) {
                if c.value < cache[city]! {
                    cache[c.key]! += 1
                }
            }
            // 해당 도시이름을 1번으로 옮긴다
            cache[city] = 1
            // cache hit이므로 res에 1 더한다
            res += 1
        }
    }
    
    return res
}
