//
//  DetailView.swift
//  TableViewCode
//
//  Created by 김재영 on 2023/11/23.
//

import UIKit


class DetailView : UIView {
    let mainImgView : UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    
    let movieNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 17)
        lb.numberOfLines = 0
        return lb
    }()
    
    let stv : UIStackView = {
        let stv = UIStackView()
        stv.axis = .vertical
        stv.distribution = .fill
        stv.alignment = .fill
        stv.spacing = 15
        return stv
    }()
    
    override init(frame : CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        setupStv()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStv(){
        
    }
}


