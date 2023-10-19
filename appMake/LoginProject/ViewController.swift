//
//  ViewController.swift
//  LoginProject
//
//  Created by 김재영 on 2023/10/13.
//

import UIKit

final class ViewController: UIViewController {
    
    private let textViewHeight : CGFloat = 48
    
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextView.centerYAnchor)
    
    
    lazy var passwordInfoLableCenterYConstant = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
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
    
    
    //MARK: - 뷰디드로드
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        makeUI()
//        stackView.addSubview(emailTextView)
//        stackView.addSubview(passwordTextField)
//        stackView.addSubview(loginBtn)
    }
    
    
    //MARK: - UI stackView Method
    func makeUI(){
        view.backgroundColor = UIColor.black
        view.addSubview(stackView)
        view.addSubview(passwordResetBtn)
        
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        passwordResetBtn.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailInfoLabel.leadingAnchor.constraint(
                equalTo: emailTextView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(
                equalTo: emailTextView.trailingAnchor, constant: 8),
//            emailInfoLabel.centerYAnchor.constraint(
//                equalTo: emailTextView.centerYAnchor),
            emailInfoLabelCenterYConstraint,
            
            
            emailTextField.leadingAnchor.constraint(
                equalTo: emailTextView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(
                equalTo: emailTextView.trailingAnchor, constant: 8),
            emailTextField.topAnchor.constraint(
                equalTo: emailTextView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(
                equalTo:emailTextView.bottomAnchor, constant: 2),
            
            
            passwordInfoLabel.leadingAnchor.constraint(
                equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo:
                passwordTextFieldView.trailingAnchor, constant:  8),
//            passwordInfoLabel.centerYAnchor.constraint(equalTo:
//                passwordTextFieldView.centerYAnchor),
            passwordInfoLableCenterYConstant,
            
            

            passwordTextField.leadingAnchor.constraint(
                equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(
                equalTo : passwordTextFieldView.trailingAnchor, constant:8),
            passwordTextField.topAnchor.constraint(
                equalTo : passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo:
                passwordTextFieldView.bottomAnchor, constant:  2),
            
            passwordSecureButton.topAnchor.constraint(
                equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            

            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(
                equalToConstant: textViewHeight * 3 + 36),
            
            passwordResetBtn.topAnchor.constraint(
                equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetBtn.leadingAnchor.constraint(
                equalTo: stackView.leadingAnchor, constant: 30),
            passwordResetBtn.trailingAnchor.constraint(
                equalTo: stackView.trailingAnchor, constant: -30),
            passwordResetBtn.heightAnchor.constraint(
                equalToConstant: textViewHeight)
            
            
        ])
        
        // NSLayoutConstraint active API 를 활용하여 사용할 수 있음
//
//        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
//        passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8).isActive = true
//        passwordInfoLabel.trailingAnchor.constraint(equalTo:
//            passwordTextFieldView.trailingAnchor, constant:  8).isActive = true
//        passwordInfoLabel.centerYAnchor.constraint(equalTo:
//            passwordTextFieldView.centerYAnchor).isActive = true
//
//
//        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
//        passwordTextField.leadingAnchor.constraint(
//            equalTo: passwordTextFieldView.leadingAnchor, constant: 8).isActive = true
//        passwordTextField.trailingAnchor.constraint(
//            equalTo : passwordTextFieldView.trailingAnchor, constant:8).isActive = true
//        passwordTextField.topAnchor.constraint(
//            equalTo : passwordTextFieldView.topAnchor, constant: 15).isActive = true
//        passwordTextField.bottomAnchor.constraint(equalTo:
//            passwordTextFieldView.bottomAnchor, constant:  2).isActive = true
//
//        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
//        passwordSecureButton.topAnchor.constraint(
//            equalTo: passwordTextFieldView.topAnchor, constant: 15).isActive = true
//        passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15).isActive = true
//        passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8).isActive = true
//
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        stackView.leadingAnchor.constraint(
//            equalTo: view.leadingAnchor, constant: 30).isActive = true
//        stackView.trailingAnchor.constraint(
//            equalTo: view.trailingAnchor, constant: -30).isActive = true
//        stackView.heightAnchor.constraint(
//            equalToConstant: textViewHeight * 3 + 36).isActive = true
        
        
        
        
// NSLayoutConstraint active API 를 활용하여 사용할 수 있음
//        emailInfoLabel.leadingAnchor.constraint(
//            equalTo: emailTextView.leadingAnchor, constant: 8).isActive = true
//        emailInfoLabel.trailingAnchor.constraint(
//            equalTo: emailTextView.trailingAnchor, constant: 8).isActive = true
//        emailInfoLabel.centerYAnchor.constraint(
//            equalTo: emailTextView.centerYAnchor).isActive = true
//

//        emailTextField.leadingAnchor.constraint(
//            equalTo: emailTextView.leadingAnchor, constant: 8).isActive = true
//        emailTextField.trailingAnchor.constraint(
//            equalTo: emailTextView.trailingAnchor, constant: 8).isActive = true
//        emailTextView.topAnchor.constraint(
//            equalTo: emailTextView.topAnchor, constant: 15).isActive = true
//        emailTextView.bottomAnchor.constraint(
//            equalTo:emailTextView.bottomAnchor, constant: 2).isActive = true
        
        
    }
    
    @objc func resetBtnTapped(){
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인버튼")
        }
        
        let cancel = UIAlertAction(title: "캔슬", style: .cancel){ cancel in
            print("취소버튼이 눌렷음")
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        present(alert, animated: true) {
            print("alert")
        }
                
    }
    
    @objc func passwordSecureModeSetting(){
        passwordTextField.isSecureTextEntry.toggle()
        print("표시버튼 누름")
    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            emailInfoLabelCenterYConstraint.constant = -13
            
        }
        if textField == passwordTextField{
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            passwordInfoLableCenterYConstant.constant = -13
        }
        
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            if emailTextField.text == "" {
                emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
                emailInfoLabelCenterYConstraint.constant = 0
            }

        }
        if textField == passwordTextField{
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            if passwordTextField.text == "" {
                emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
                passwordInfoLableCenterYConstant.constant = 0
            }
        }
        
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
    
    
    @objc func textFieldEditingChanged(textField : UITextField){
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        
        guard
            let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty else {
            loginBtn.backgroundColor = .clear
            loginBtn.isEnabled = false
            return
        }
        loginBtn.backgroundColor = .red
        loginBtn.isEnabled = true
    }
    
    @objc func loginBtnTapped(textField : UITextField){
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

