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
    
    var bmi : Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
        
    }
    
    
    
    @IBAction func calculateBtnTapped(_ sender: UIButton) {
        guard let h = heightTextField.text, let w = weightTextField.text else { return }
        bmi = calculateBMI(height: h , weight: w)
        
    }
    
    func calculateBMI(height : String, weight : String) -> Double {
        guard let h = Double(height), let w = Double(weight) else {return 0.0}
        var bmi  = w / (h * h) * 10000
        bmi = round(bmi*10) / 10
        print(bmi)
        return bmi
    }
    
    func getBackgroudColor() -> (UIColor, String) {
        guard let bmi = bmi else {return (UIColor.black, "없음")}
        switch bmi {
        case ..<18.6 :
            return (UIColor.blue, "저체중")
        case 18.6..<23.0 :
            return (UIColor.green, "미달")
        case 23.0..<25.0 :
            return (UIColor.yellow, "정상")
        case 25.0..<30.0 :
            return (UIColor.magenta, "과체중")
        case 30.0... :
            return (UIColor.red, "비만")
        default : return (UIColor.black, "없음")
        }
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
            secondVC.bmi = self.bmi
            (secondVC.bmiColor, secondVC.adviceString) = getBackgroudColor()
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

