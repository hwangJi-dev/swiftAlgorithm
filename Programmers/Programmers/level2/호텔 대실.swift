//
//  호텔 대실.swift
//  Programmers1
//
//  Created by hwangJi on 2023/02/03.
//

import Foundation

func solution(book_time:[[String]]) -> Int {
    var bookList: [(Int, Int)] = []

    // Int로 시간변환
    for b in book_time {
        let t1 = Int(b[0].components(separatedBy: ":").map{ String($0) }.joined())!
        var t2 = Int(b[1].components(separatedBy: ":").map{ String($0) }.joined())! + 10
        
        // 청소시간을 합친 분 시간이 60분을 넘는다면
        if t2 % 100 >= 60 {
            // 40을 더해준다
            t2 += 40
        }

        bookList.append((t1, t2))
    }

    // 퇴실 시간이 큰 순서대로 정렬
    bookList = bookList.sorted(by: { $0.1 > $1.1 })
    var assignRoomList: [[(Int, Int)]] = [[bookList.first!]]

    for b in 1..<bookList.count {
        var isBooked = false
        for (i, r) in assignRoomList.enumerated() {
            // 퇴실시간보다 입실 시간이 늦거나, 입실 시간보다 퇴실 시간이 빠른 경우
            if bookList[b].0 >= r.last!.1 || r.last!.0 >= bookList[b].1 {
                // 해당 룸에 예약 리스트를 추가한다
                assignRoomList[i].append(bookList[b])
                isBooked = true
                break
            }
        }

        // 예약되지 않았다면
        if !isBooked {
            // 새로운 방을 배정한다
            assignRoomList.append([bookList[b]])
        }
    }

    return assignRoomList.count
}
