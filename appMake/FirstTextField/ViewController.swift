//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 김재영 on 2023/10/06.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        setup()
    }
    
    
    func setup(){
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일입력"
        textField.borderStyle = .roundedRect
        
        textField.clearButtonMode = .always
        textField.returnKeyType = .go
    }
    
    
    // 텍스트 필드의 입력을 시작할때 호출(시작할지 말지의 여부를 허락)
    func textFieldShoudBeginEditing(_ textField: UITextField) -> Bool{
        return true
    }
    
    // 텍스트 필드의 입력을 시작하는 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return false
    }
    
    // 텍스트필드 글자 내용이 입력되거나 지워질때 호출이 되고(허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 10
        let currentString : NSString = (textField.text ?? "") as NSString
        let newString : NSString = currentString.replacingCharacters(in: range, with: string ) as NSString
        return newString.length <= maxLength
        
        
//        if Int(string) != nil {
//            return false
//        }else {
//            guard let text = textField.text else { return true }
//            let newLength = text.count + string.count - range.length
//            return newLength <= 10
//        }
        
        
    }
    
    
    
    // 엔터키가 눌러지면 다음 동작을 허락할지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "Type Something"
            return false
        }else {
            return true
        }
    }
    
    // 텍스트 필드 입력이 끝날때 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍슽츠 필드 입력이 끝날때 시점
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        textField.text = ""
        print(#function)
    }
    
    
    

    @IBAction func doneBtnTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

