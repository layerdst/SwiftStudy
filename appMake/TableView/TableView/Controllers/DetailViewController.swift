//
//  DetailViewController.swift
//  TableView
//
//  Created by 김재영 on 2023/11/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movieData : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()


    }
    
    func setUpUI() {
        mainImageView.image = movieData?.movieImage
        movieNameLabel.text = movieData?.movieName
        descriptionLabel.text = movieData?.movieDescription
    }
    

}
