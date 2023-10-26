//
//  ViewController.swift
//  BMICodeMake
//
//  Created by 김재영 on 2023/10/26.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var mainLabel : UILabel = {
        let label = UILabel()
        label.text = "키와 몸무게를 입력해주세요"
        label.textAlignment = .center
        label.font.withSize(15.0)
        return label
    }()
    
    lazy var heightLabel : UILabel = {
        let label = UILabel()
        label.text = "키"
        label.textAlignment = .center
        label.font.withSize(15.0)
        return label
    }()
    
    lazy var heightTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "cm 단위로 키를 입력"
        return tf
    }()
    
    lazy var weightLabel : UILabel = {
        let label = UILabel()
        label.text = "몸무게"
        label.textAlignment = .center
        label.font.withSize(15.0)
        let maxSize = CGSize(width: 150, height: 300)
        let size = label.sizeThatFits(maxSize)
        
        return label
    }()
    
    lazy var weightTextField : UITextField = {
        let tf = UITextField()

        tf.placeholder = "cm 단위로 키를 입력"
        
        
        return tf
    }()
    
    lazy var calculateBMIBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("BMI 계산하기", for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var heightStackView : UIStackView = {
        let stv = UIStackView(arrangedSubviews: [
            heightLabel,
            heightTextField
        ])
        return stv
    }()
    
    lazy var weightStackView : UIStackView = {
        let stv = UIStackView(arrangedSubviews: [
            weightLabel,
            weightTextField
        ])
        return stv
    }()
    
    
    func makeUI(){
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

