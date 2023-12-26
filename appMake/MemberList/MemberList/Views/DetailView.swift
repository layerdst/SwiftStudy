//
//  DetailView.swift
//  MemberList
//
//  Created by 김재영 on 2023/12/04.
//

import UIKit

class DetailView: UIView {
    
    var member : Member? {
        didSet {
            guard var member = member else {
                updateBtn.setTitle("SAVE", for: .normal)
                memberIdTextField.text = "\(Member.memberNumbers)"
                return
            }
            
            mainImgView.image = member.memberImg
            memberIdTextField.text = "\(member.memberId)"
            nameTextField.text = member.name
            phoneTextField.text = member.phone
            addressTextField.text = member.address
            
            guard let age = member.age else {
                ageTextField.text = ""
                return
            }
            
            ageTextField.text = "\(age)"
            
        }
    }
    
    lazy var mainImgView : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = .lightGray
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 75
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    lazy var imageContrainView : UIView = {
        let view = UIView()
        view.addSubview(mainImgView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var memberIdLabel : UILabel = {
        return labelSetting("멤버번호")
    }()
    
    lazy var memberIdTextField : UITextField = {
        return textFieldSetting()
    }()
    
    lazy var memberIdStv : UIStackView = {
        return stvSetting([memberIdLabel, memberIdTextField])
    }()
    
    lazy var nameLabel : UILabel = {
        return labelSetting("이   름")
    }()
    
    lazy var nameTextField : UITextField = {
        return textFieldSetting()
    }()
    
    lazy var nameStv : UIStackView = {
        return stvSetting([nameLabel, nameTextField])
    }()
    
    lazy var ageLabel : UILabel = {
        return labelSetting("나   이")
    }()
    
    lazy var ageTextField : UITextField = {
        return textFieldSetting()
    }()
    
    lazy var ageStv : UIStackView = {
        return stvSetting([ageLabel, ageTextField])
    }()
    
    lazy var phoneNumLabel : UILabel = {
        return labelSetting("전화번호")
    }()
    
    lazy var phoneTextField : UITextField = {
        return textFieldSetting()
    }()
    
    lazy var phoneStv : UIStackView = {
        return stvSetting([phoneNumLabel, phoneTextField])
    }()
    
    lazy var addressLabel : UILabel = {
        return labelSetting("주   소")
    }()
    
    
    lazy var addressTextField : UITextField = {
        return textFieldSetting()
    }()
    
    
    lazy var addressStv : UIStackView = {
        return stvSetting([addressLabel, addressTextField])
    }()
    
    lazy var updateBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.setTitle("업데이트", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    lazy var totalStv : UIStackView = {
        let stv = UIStackView(arrangedSubviews: [imageContrainView, memberIdStv, nameStv, ageStv, addressStv, updateBtn])
        stv.translatesAutoresizingMaskIntoConstraints = false
        stv.spacing = 10
        stv.axis = .vertical
        stv.distribution = .fill
        stv.alignment = .fill
        
        return stv
    }()
    
    func stvSetting(_ view : [UIView]) -> UIStackView {
        let stv = UIStackView(arrangedSubviews: view)
        stv.spacing = 5
        stv.axis = .horizontal
        stv.distribution = .fill
        stv.alignment = .fill
        stv.translatesAutoresizingMaskIntoConstraints = false
        return stv
    }
    
    func textFieldSetting() -> UITextField {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }
    
    func labelSetting(_ name : String) -> UILabel {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.text = name
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }
    
    func setupStv(){
        self.addSubview(totalStv)
    }
    
    func setUpNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(moveUpAction),
                                         name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override init (frame : CGRect){
        super.init(frame: frame)
        self.backgroundColor = .gray
        setupStv()
        mainImgViewConstraints()
        imgContainerConstraints()
        labelWidthConstraints()
        stvConstraints()
        setUpNotification()
        memberIdTextField.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func mainImgViewConstraints(){
        NSLayoutConstraint.activate([
            mainImgView.heightAnchor.constraint(equalToConstant: 150),
            mainImgView.widthAnchor.constraint(equalToConstant: 150),
            mainImgView.centerXAnchor.constraint(equalTo: imageContrainView.centerXAnchor),
            mainImgView.centerYAnchor.constraint(equalTo: imageContrainView.centerYAnchor)
        ])
    }
    
    func imgContainerConstraints(){
        NSLayoutConstraint.activate([
            imageContrainView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    func labelWidthConstraints(){
        NSLayoutConstraint.activate([
            memberIdLabel.widthAnchor.constraint(equalToConstant: 70),
            nameLabel.widthAnchor.constraint(equalToConstant: 70),
            ageLabel.widthAnchor.constraint(equalToConstant: 70),
            phoneNumLabel.widthAnchor.constraint(equalToConstant: 70),
            addressLabel.widthAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    func stvConstraints(){
      
        NSLayoutConstraint.activate([
            totalStv.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            totalStv.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            totalStv.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            totalStv.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func moveUpAction(){
        totalStv.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -20)
        UIView.animate(withDuration: 0.2){
            self.layoutIfNeeded()
        }
    }
    
    @objc func moveDownAction(){
        totalStv.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10)
        UIView.animate(withDuration: 0.2){
            self.layoutIfNeeded()
        }
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
}

extension DetailView : UITextFieldDelegate {
    func textField(_ textField : UITextField, shouldChangeCharactersIn range : NSRange, replacementString string : String ) -> Bool {
        if textField == memberIdTextField {
            return false
        }
        return true
    }
}
