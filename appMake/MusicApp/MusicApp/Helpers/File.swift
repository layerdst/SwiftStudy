//
//  File.swift
//  MusicApp
//
//  Created by 김재영 on 2024/01/16.
//

import UIKit

public enum MusicApi {
    static let requestUrl = "https://itunes.apple.com/search?"
    static let mediaParam = "media=music"
}

public struct Cell {
    static let musicCellIndenifier = "MusicCell"
    static let musicCollectionViewCellIndentifier = "MusicCollectionViewCell"
    private init() {}
}

public struct CVCell {
    static let spacingWidth : CGFloat = 1
    static let cellColumns : CGFloat = 3
    private init() {}
}


