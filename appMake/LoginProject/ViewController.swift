//
//  ViewController.swift
//  LoginProject
//
//  Created by 김재영 on 2023/10/13.
//

import UIKit

class ViewController: UIViewController {
    
//    let emailTextFieldView = UIView()

    let emailTextFieldView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeIUI()
        
        
    }
    
    func makeIUI(){

        view.addSubview(emailTextFieldView)
        // 오토레이아웃 기능을 끄는것, 반드시 설정해야지만 수동으로 레이아웃을 설정이 가능함
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        
        // 텍스트뷰 화면 배치
        // leadingAnchor : 화면 좌측에서
        // trailingAnchor : 화면 우측
        // topAnchor : 화면 상단
        // heightAnchor : 뷰 높이
        emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        emailTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        emailTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }


}

