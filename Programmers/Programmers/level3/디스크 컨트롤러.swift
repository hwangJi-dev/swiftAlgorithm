//
//  디스크 컨트롤러.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/11.
//

import Foundation

func solution(jobs:[[Int]]) -> Int {
    var sortedJobs = jobs.sorted(by: {
        if $0[0] == $1[0] {
            return $0[1] > $1[1]
        } else {
            return $0[0] > $1[0]
        }
    })
    var jobQueue: [[Int]] = [sortedJobs.removeLast()]
    var totalTime = 0
    var time = jobQueue.first![0]
    
    while !jobQueue.isEmpty {
        let now = jobQueue.removeLast()
        totalTime += abs(time - now[0]) + now[1]
        time += now[1]
        
        while !sortedJobs.isEmpty && sortedJobs.last![0] <= time {
            jobQueue.append(sortedJobs.removeLast())
        }
        jobQueue.sort(by: { $0[1] > $1[1] })
        
        if jobQueue.isEmpty && !sortedJobs.isEmpty {
            jobQueue.append(sortedJobs.removeLast())
            time += abs(time - jobQueue.last![0])
        }
    }
    
    return totalTime / jobs.count
}
