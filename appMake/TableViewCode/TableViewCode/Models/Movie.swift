//
//  Movie.swift
//  TableViewCode
//
//  Created by 김재영 on 2023/11/22.
//

import UIKit

struct Movie {
    var movieImage : UIImage?
    let movieName : String
    let movieDescription : String
    
    init(_ movieImage : UIImage, _ movieName : String, _ movieDescription : String){
        self.movieImage = movieImage
        self.movieName = movieName
        self.movieDescription = movieDescription
    }
}
