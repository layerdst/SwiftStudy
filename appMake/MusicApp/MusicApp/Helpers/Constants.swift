//
//  Constants.swift
//  MusicApp
//
//  Created by 김재영 on 2024/01/20.
//

import Foundation

import UIKit

public enum MusicApi {
    static let requestUrl = "https://itunes.apple.com/search?"
    static let mediaParam = "media=music"
}


public struct Cell {
    static let musicCellIdentifier = "MusicCell"
    static let musicCollectionViewCellIdentifier = "MusicCollectionViewCell"
    private init() {}
}

public struct CVCell {
    static let spacingWitdh: CGFloat = 1
    static let cellColumns: CGFloat = 3
    private init() {}
}

