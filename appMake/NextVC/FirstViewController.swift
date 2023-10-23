//
//  FirstViewController.swift
//  NextVC
//
//  Created by 김재영 on 2023/10/20.
//

import UIKit

class FirstViewController: UIViewController {
    
    var someString : String?
    
    lazy var mainLabel : UILabel = {
        var label = UILabel()
        label.text = someString
        return label
    }()
    

    
    lazy var backBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Back", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        makeUI()
        
        
    }
    
    func setUp(){
        view.addSubview(mainLabel)
        view.addSubview(backBtn)
        view.backgroundColor = .gray
    }
    
    func makeUI(){

        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        backBtn.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backBtn.widthAnchor.constraint(equalToConstant: 70),
            backBtn.heightAnchor.constraint(equalToConstant: 40),
            backBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant : -40),
            backBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
                      
    @objc func backBtnTapped () {
        dismiss(animated: true)
        
    }

}
