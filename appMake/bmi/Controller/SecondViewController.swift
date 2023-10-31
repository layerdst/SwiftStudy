//
//  SecondViewController.swift
//  BMI
//
//  Created by 김재영 on 2023/10/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceNumberLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    var bmi : BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI(){
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
     
        
        guard let bmi = bmi else { return }
        
        adviceNumberLabel.text = "\(bmi.advice)"
        bmiNumberLabel.backgroundColor = bmi.matchColor
        
        backBtn.clipsToBounds = true
        backBtn.layer.cornerRadius = 5
    
        bmiNumberLabel.text = "\(bmi.value)"
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
