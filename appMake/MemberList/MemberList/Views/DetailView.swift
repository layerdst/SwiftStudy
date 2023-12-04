//
//  DetailView.swift
//  MemberList
//
//  Created by 김재영 on 2023/12/04.
//

import UIKit

class DetailView: UIView {
    
    let mainImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = .lightGray
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 75
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let imageContrainView : UIView = {
        let view = UIView()
//        view.addSubview(mainImgView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let memberIdLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let memberIdTextField : UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var memberIdStv : UIStackView = {
        let stv = UIStackView(arrangedSubviews: [memberIdLabel, memberIdTextField])
        stv.spacing = 5
        stv.axis = .horizontal
        stv.distribution = .fill
        stv.alignment = .fill
        stv.translatesAutoresizingMaskIntoConstraints = false
        return stv
    }()
    
    let nameLabel : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.text = "이     름"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let nameTextField : UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var nameStv : UIStackView = {
        let stv = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        stv.spacing = 5
        stv.axis = .horizontal
        stv.distribution = .fill
        stv.alignment = .fill
        stv.translatesAutoresizingMaskIntoConstraints = false
        return stv
    }()
    
    let ageLabel : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.text = "나 이"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let ageTextField : UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    

}
