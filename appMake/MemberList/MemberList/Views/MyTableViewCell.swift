//
//  MyTableViewCell.swift
//  MemberList
//
//  Created by 김재영 on 2023/11/29.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    let mainImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let memberNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addreddLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stv : UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    func setStackView(){
        self.addSubview(mainImgView)
        self.addSubview(stv)
        stv.addArrangedSubview(memberNameLabel)
        stv.addArrangedSubview(addreddLabel)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setStv()
    }
    
    func setStv(){
        self.addSubview(mainImgView)
        self.addSubview(stv)
        
        [memberNameLabel, addreddLabel].forEach{stv.addArrangedSubview($0)}
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func updateConstraints() {
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.mainImgView.clipsToBounds = true
        self.mainImgView.layer.cornerRadius = self.mainImgView.frame.width / 2
    }
    
    func nsLayoutConstraints( _ constraints : [NSLayoutConstraint]){
        NSLayoutConstraint.activate(constraints)
    }
    
    func mainImgViewConstraints(){
        nsLayoutConstraints([
            mainImgView.heightAnchor.constraint(equalToConstant: 40),
            mainImgView.widthAnchor.constraint(equalToConstant: 40),
            mainImgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainImgView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func memberNameLabelConstraints(){
        nsLayoutConstraints([
            memberNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func stvConstraints(){
        nsLayoutConstraints([
            stv.leadingAnchor.constraint(equalTo: mainImgView.trailingAnchor, constant: 20),
            stv.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stv.topAnchor.constraint(equalTo: self.mainImgView.topAnchor),
            stv.bottomAnchor.constraint(equalTo: self.mainImgView.bottomAnchor)
        ])
    }
    
    
    func setConstraints(){
        mainImgViewConstraints()
        memberNameLabelConstraints()
        stvConstraints()
    }

}
