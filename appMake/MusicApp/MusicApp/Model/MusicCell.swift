//
//  Music.swift
//  MusicApp
//
//  Created by 김재영 on 2024/01/16.
//

import Foundation

struct MusicData : Codable {
    let resultCount : Int
    let results : [Music]
}

struct Music : Codable {
    let songName : String?
    let artistName : String?
    let albumName : String?
    let previewUrl : String?
    let imgUrl : String?
    private let releaseDate : String?
    
    enum CodingKeys : String, CodingKey {
        case songName = "trackName"
        case artistName
        case albumName = "collectionName"
        case previewUrl
        case imgUrl = "artworkUrl1100"
        case releaseDate
    }
    
    var realeaseDateString : String? {
        guard let isoDate = ISO8601DateFormatter().date(from: releaseDate ?? "" ) else {return "" }
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = myFormatter.string(from: isoDate)
        return dateString
    }
    
}
