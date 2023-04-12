//
//  베스트앨범.swift
//  Programmers1
//
//  Created by hwangJi on 2023/04/12.
//

import Foundation

struct Music {
    var playCnt: Int
    var index: Int
}

func solution(genres:[String], plays:[Int]) -> [Int] {
    var genreDict: [String: ([Music], Int)] = [:]
    var album: [Int] = []
    
    for (idx, genre) in genres.enumerated() {
        if genreDict[genre] != nil {
            genreDict[genre]!.0.append(Music(playCnt: plays[idx], index: idx))
            genreDict[genre]!.1 += plays[idx]
        } else {
            genreDict[genre] = ([Music(playCnt: plays[idx], index: idx)], plays[idx])
        }
    }
    
    for i in genreDict.sorted(by: { $0.value.1 > $1.value.1 }) {
        let music = i.value.0.sorted(by: {
            return ($0.playCnt == $1.playCnt) ? $0.index < $1.index : $0.playCnt > $1.playCnt
        }).map({ $0.index })
        album += music.count >= 2 ? music[0...1] : [music[0]]
    }
    
    return album
}

//func solution(genres:[String], plays:[Int]) -> [Int] {
//    var genreDict: [String: Int] = [:]
//    var musics: [Music] = []
//    var album: [Int] = []
//
//    for (idx, genre) in genres.enumerated() {
//        musics.append(Music(genre: genre, playCnt: plays[idx], index: idx))
//        if genreDict[genre] == nil {
//            genreDict[genre] = plays[idx]
//        } else {
//            genreDict[genre]! += plays[idx]
//        }
//    }
//
//    musics = musics.sorted(by: {
//        if $0.playCnt == $1.playCnt {
//            return $0.index < $1.index
//        } else {
//            return $0.playCnt > $1.playCnt
//        }
//    })
//
//    for i in genreDict.sorted(by: { $0.value > $1.value }) {
//        let music = musics.filter({ $0.genre == i.key }).map({ $0.index })
//        if music.count >= 2 {
//            album += music[0...1]
//        } else {
//            album.append(music[0])
//        }
//    }
//
//    return album
//}
