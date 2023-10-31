//
//  ViewController.swift
//  BMI
//
//  Created by 김재영 on 2023/10/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var calculateBtn: UIButton!
    
    var bmiManager = BMICaculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    
    
    @IBAction func calculateBtnTapped(_ sender: UIButton) {
        guard let h = heightTextField.text, let w = weightTextField.text else { return }
        bmiManager.calculateBMI(height: h , weight: w)
        bmiManager.getBMIResult()
    }

    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력해야함"
            mainLabel.textColor = .red
            return false
        }
        
        mainLabel.text = "키와 몸무게를 입력해주세요"
        mainLabel.textColor = .black
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "twoSecondVC" {
            guard let secondVC = segue.destination as? SecondViewController else {return }
            secondVC.bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
        }
        
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    
    func makeUI(){
        heightTextField.delegate = self
        weightTextField.delegate = self
        mainLabel.text = "키와 몸무게를 입력해주세요"
        calculateBtn.layer.cornerRadius = 5
        calculateBtn.clipsToBounds = true
        calculateBtn.setTitle("BMI 계산하기", for: .normal)
        heightTextField.placeholder = "cm 단위로 입력"
        weightTextField.placeholder = "kg 단위로 입력"
        
    }
    
    
}

extension ViewController : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != ""{
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
}

