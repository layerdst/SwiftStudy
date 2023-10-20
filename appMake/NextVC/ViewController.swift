//
//  ViewController.swift
//  NextVC
//
//  Created by 김재영 on 2023/10/20.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var codeNextBtn : UIButton = {
        return customizeBtn(name: "Code Next")
    }()
    
    lazy var  storyBoardBtn : UIButton = {
       return customizeBtn(name: "StoryBoard with Code")
    }()
    
    lazy var  storyBoarWithSequeBtn : UIButton = {
        return customizeBtn(name: "StoryBoard with Seque")
    }()
    
    lazy var  StoryBoardWithButtonSeque : UIButton = {
        return customizeBtn(name: "StoryBoard with Btn Seque")
    }()
    
    lazy var stackView : UIStackView = {
        let stv = UIStackView (
                arrangedSubviews: [
                    codeNextBtn,
                    storyBoardBtn,
                    storyBoarWithSequeBtn,
                    StoryBoardWithButtonSeque
            ]
        )
        stv.spacing = 30
        stv.axis = .vertical
        stv.distribution = .fillEqually
        stv.alignment = .fill
        
        return stv
    }()
    
    func customizeBtn ( name : String ) -> UIButton {
        var btn = UIButton()
        btn.backgroundColor = UIColor.blue
        btn.setTitle(name, for: .normal)
        btn.titleLabel?.textColor = UIColor.white
        return btn
    }
    
    func makeUI(){
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: 300)
        ])
      
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }


}

