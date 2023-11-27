//
//  DetailViewController.swift
//  TableViewCode
//
//  Created by 김재영 on 2023/11/27.
//

import UIKit

class DetailViewController : UIViewController{
    private let detailView = DetailView()
    
    var movieData : Movie?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        detailView.mainImgView.image = movieData?.movieImage
        detailView.movieNameLabel.text = movieData?.movieName
        detailView.descriptionLabel.text = movieData?.movieDescription
    }
}

