//
//  연료탱크 설계.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/04.
//

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var ans: [Int: [Int]] = [125000: []]
    
    for i in 1...50 {
        if n % i != 0 {
            continue
        }
        let x = n / i
        
        for j in 1...x {
            if x % j != 0 {
                continue
            }
            let y = x / j
            
            for k in 1...y {
                if i * j * k != n {
                    continue
                }
                // 계산
                let surface = calSurface(i, j, k)
                if ans.first!.key >= surface {
                    if ans.first!.key == surface {
                        // 사전순 앞선것 채택
                        if ans.first!.value[0] > i {
                            ans = [surface: [i, j, k]]
                        } else if ans.first!.value[0] == i {
                            if ans.first!.value[1] > j {
                                ans = [surface: [i, j, k]]
                            } else if ans.first!.value[1] == j {
                                if ans.first!.value[2] > k {
                                    ans = [surface: [i, j, k]]
                                }
                            }
                        }
                    } else {
                        ans = [surface: [i, j, k]]
                    }
                }
            }
        }
    }
    
    print(ans.first!.value)
}

func calSurface(_ x: Int, _ y: Int, _ z: Int) -> Int {
    return (x * y) * 2 + (y * z) * 2 + (z * x) * 2
}
