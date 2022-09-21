//
//  주차 요금 계산.swift
//  Programmers1
//
//  Created by hwangJi on 2022/09/21.
//

import Foundation

struct ParkingInfo {
    var hour: Int
    var minute: Int
    var state: String
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var parkingRecord: [String: [ParkingInfo]] = [:]
    var feeDict: [String: Int] = [:]
    
    for record in records {
        let splitRecord = record.components(separatedBy: [":", " "])

        if parkingRecord[splitRecord[2]] == nil {
            parkingRecord[splitRecord[2]] = []
        }
        
        parkingRecord[splitRecord[2]]?.append(ParkingInfo(hour: Int(splitRecord[0])!, minute: Int(splitRecord[1])!, state: splitRecord[3]))
    }
    
    for carRecord in parkingRecord {
        var carRecord = carRecord
        // 입차된 기록만 있는 경우
        if carRecord.value.last?.state == "IN" {
            // 23:59에 출차된 것으로 간주
            carRecord.value.append(ParkingInfo(hour: 23, minute: 59, state: "OUT"))
        }
        
        // 차량의 총 주차 시간을 계산
        var sum = 0
        for j in stride(from: 0, through: carRecord.value.count - 1, by: 2) {
            sum += calParkingTime(carRecord.value[j], carRecord.value[j + 1])
        }
        
        feeDict[carRecord.key] = sum
    }
    
    // [차량 번호: 주차 시간] Dict를 기반으로 차량별 총 주차 요금을 계산하여 리턴
    return calParkingFee(fees, feeDict)
}

// MARK: - 주차시간을 분 단위로 계산하는 함수
func calParkingTime(_ inTime: ParkingInfo, _ outTime: ParkingInfo) -> Int {
    return abs((inTime.hour * 60 + inTime.minute) - (outTime.hour * 60 + outTime.minute))
}

// MARK: - 주차요금 계산 함수
func calParkingFee(_ fees: [Int], _ feeDict: [String: Int]) -> [Int] {
    var feeDict = feeDict
    let basicHour = fees[0]
    let basicFee = fees[1]
    let overHour = fees[2]
    let overFee = fees[3]

    for (carNumber, parkingHour) in feeDict {
        // 기본 요금 범위
        if parkingHour < basicHour {
            feeDict[carNumber] = basicFee
        } else {
            // 초과 요금 범위
            var exceedTime = 0
            if (parkingHour - basicHour) % overHour != 0 {
                exceedTime = ((parkingHour - basicHour) / overHour) + 1
            } else {
                exceedTime = ((parkingHour - basicHour) / overHour)
            }
            feeDict[carNumber] = exceedTime * overFee + basicFee
        }
    }

    // 차량 번호가 작은 자동차부터 차례대로 담아 Array를 리턴
    return feeDict.sorted{ $0.key < $1.key }.map{ Int($0.value) }
}
