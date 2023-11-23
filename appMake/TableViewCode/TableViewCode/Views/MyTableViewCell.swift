//
//  MyTableViewCell.swift
//  TableViewCode
//
//  Created by 김재영 on 2023/11/22.
//

import UIKit

class MyTableViewCell : UITableViewCell {
    let mainImgView : UIImageView = {
        let imgView = UIImageView()
//        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let movieNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize:17)
        label.numberOfLines = 0
        return label
    }()
    
    let stv : UIStackView = {
        let stv = UIStackView()
        stv.axis = .vertical
        stv.distribution = .fill
        stv.alignment = .fill
        stv.spacing = 8
        return stv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier : String?){
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setUpStv()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpStv(){
        contentView.addSubview(mainImgView)
        contentView.addSubview(stv)
        
        stv.addArrangedSubview(movieNameLabel)
        stv.addArrangedSubview(descriptionLabel)
    }
    
    func setConstraints(){
        mainImgViewConstraints()
        movieNameLabelConstraints()
        stackViewConstraints()
    }
    
    func mainImgViewConstraints(){
        mainImgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainImgView.heightAnchor.constraint(equalToConstant: 100),
            mainImgView.widthAnchor.constraint(equalToConstant: 100),
            mainImgView.leadingAnchor.constraint(equalTo : contentView.leadingAnchor, constant: 10),
            mainImgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ]
        )
    }
    
    func movieNameLabelConstraints(){
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieNameLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    func stackViewConstraints(){
        stv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stv.leadingAnchor.constraint(equalTo: mainImgView.trailingAnchor, constant: 15),
            stv.trailingAnchor.constraint(equalTo: trailingAnchor),
            stv.topAnchor.constraint(equalTo: mainImgView.topAnchor),
            stv.bottomAnchor.constraint(equalTo: mainImgView.bottomAnchor)
        ])
    }


}
