//
//  키패드 누르기.swift
//  ProgrammersLevel1
//
//  Created by hwangJi on 2022/08/01.
//

import Foundation

var useHandsString: String = ""
var currentLPosition: String = "*"
var currentRPosition: String = "#"

func solution(_ numbers:[Int], _ hand:String) -> String {
    for i in numbers {
        switch i {
        case 1, 4, 7:
            leftPress(num: i)
        case 2, 5, 8, 0:
            let distanceByLeft = calDistance(num: i, currentPosition: currentLPosition)
            let distanceByRight = calDistance(num: i, currentPosition: currentRPosition)
            
            if distanceByLeft == distanceByRight {
                if hand == "left" {
                    leftPress(num: i)
                } else {
                    rightPress(num: i)
                }
            } else if distanceByLeft > distanceByRight {
                rightPress(num: i)
            } else {
                leftPress(num: i)
            }
        case 3, 6, 9:
            rightPress(num: i)
        default:
            print("default")
        }
    }
    
    return useHandsString
}

func leftPress(num: Int) {
    useHandsString += "L"
    currentLPosition = String(describing: num)
}

func rightPress(num: Int) {
    useHandsString += "R"
    currentRPosition = String(describing: num)
}

func calDistance(num: Int, currentPosition: String) -> Int {
    var numLocation: [Int] = []
    var currentLocation: [Int] = []
    
    if num == 0 {
        numLocation = [3, 1]
    } else {
        numLocation = calPosition(num: num)
    }
    
    if currentPosition == "*" {
        currentLocation = [3, 0]
    } else if currentPosition == "#" {
        currentLocation = [3, 2]
    } else {
        currentLocation = calPosition(num: Int(currentPosition)!)
    }
    
    return abs(numLocation[0] - currentLocation[0]) + abs(numLocation[1] - currentLocation[1])
}

func calPosition(num: Int) -> [Int] {
    if num == 0 {
        return [3, 1]
    } else {
        return [(num - 1) / 3, ((num - 1) % 3)]
    }
}
