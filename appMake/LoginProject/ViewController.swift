//
//  ViewController.swift
//  LoginProject
//
//  Created by 김재영 on 2023/10/13.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var emailTextView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var emailInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "이메일 주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    
    private lazy var emailTextField : UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        
        // 영문자 항상 소문자로 시작하는 설정
        tf.autocapitalizationType = .none
        
        // 자동수저
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    
    private lazy var passwordTextFieldView : UIView = {
        let view = UIView()
        view.frame.size.height = 48
        view.backgroundColor = .clear
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
        
    }()
    
    private lazy var passwordInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = false
        return tf
    }()
    
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func makeUI(){
        
    }


}

