//
//  MovieCell.swift
//  MusicApp
//
//  Created by 김재영 on 2024/01/20.
//

import UIKit

class MusicCell: UITableViewCell {
    
    
    @IBOutlet weak var mainImgView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var ablumNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var imgUrl : String? {
        didSet {
            loadImg()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mainImgView.image = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainImgView.contentMode = .scaleToFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadImg(){
        guard let urlString = self.imgUrl, let url = URL(string : urlString) else { return }
        DispatchQueue.main.async {
            guard let data = try? Data(contentsOf: url) else { return }
            guard urlString == url.absoluteString else { return }
            self.mainImgView.image = UIImage(data  : data )
        }
    }

}
