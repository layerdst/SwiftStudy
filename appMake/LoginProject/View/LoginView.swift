//
//  LoginView.swift
//  LoginProject
//
//  Created by 김재영 on 2023/11/06.
//

import UIKit

class LoginView : UIView {
    // MARK: - 이메일 텍스트뷰
    private lazy var emailTextView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel)
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
        
        tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        return tf
    }()
    
    
    // MARK: - 패스워드 텍스트 뷰
    private lazy var passwordTextFieldView : UIView = {
        let view = UIView()
        view.frame.size.height = 48
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
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
        tf.clearsOnBeginEditing = true
        tf.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        return tf
    }()
    
    private let passwordSecureButton : UIButton = {
        let btn = UIButton(type: .close)
        btn.setTitle("표시", for: .normal)
        btn.setTitleColor( #colorLiteral(red:0.8374, green: 0.8374, blue:0.8374, alpha : 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        btn.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return btn
    }()
    
    
    // MARK: - 로그인버튼
    private let loginBtn : UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.layer.borderWidth = 1
        btn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        btn.setTitle("로그인", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    
    // MARK: - 스택뷰
    lazy var stackView : UIStackView = {
        let stv = UIStackView(
            arrangedSubviews: [
                emailTextView,
                passwordTextFieldView,
                loginBtn
            ]
        )
        
        stv.spacing = 18
        stv.axis = .vertical
        stv.distribution = .fillEqually
        stv.alignment = .fill
        return stv
    }()
    
    
    // 비밀번호 재설정
    private let passwordResetBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitle("비밀번호 재설정", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(resetBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    private let textViewHeight : CGFloat = 48
    
    lazy var emailInfoCenterYCenterYContraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextView.centerYAnchor)
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
    override init (frame : CGRect) {
        super.init(frame: frame)
        setup()
        addViews()
        setConstraint()
    }
    
    required init?(coder : NSCoder){
        fatalError("init(code:) has not been implemented")
    }
    
    func setup(){}
    
    func addViews(){}
    
    func setConstraint(){
        //emailInfoLabel
        //emailTextFieldConstraint()
        //passwordConstraint()
        //passwordInfoLabelConstraint()
        //passwordTextFieldConstraint()
        //passwordSecureBtnConstraint()
        //stackViewContraint()
        //passwordResetBtnConstraint()
        
    }
    
    @objc private func textFieldEditingChanged(_ textField : UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " "{
                textField.text = ""
                return
            }
        }
        
        guard
            let email = emailTextField.text, !email.isEmpty,
            let pw = passwordTextField.text, !pw.isEmpty
        else {
            loginBtn.backgroundColor = .clear
            loginBtn.isEnabled = false
            return
        }
        
        loginBtn.backgroundColor = .red
        loginBtn.isEnabled = true
        
    }
    
    @objc func passwordSecureModeSetting(){
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    
}

extension LoginView : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            emailInfoLabelCenterYConstraint.constant = -13
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            passwordInfoLabelCenterYConstraint.constant = -13
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextView.background = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            if emailTextField.text == "" {
                emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
                emailInfoLabelCenterYConstraint.constant = 0
            }
            
        }
        
        UIView.animate(withDuration: 0.3){
            self.stackView.layoutIfNeeded()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}
