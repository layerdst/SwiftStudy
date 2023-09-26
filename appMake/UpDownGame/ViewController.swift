//
//  ViewController.swift
//  UpDownGame
//
//  Created by 김재영 on 2023/09/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var introduceLabel: UILabel!
    
    @IBOutlet weak var numberSelectedLabel: UILabel!
    
    var computerSelectedNum = Int.random(in: 1...10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introduceLabel.text = "선택하세요"
        numberSelectedLabel.text = ""
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {

        let numString = sender.currentTitle!
        numberSelectedLabel.text = numString
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {

        introduceLabel.text = "선택하세요"
        numberSelectedLabel.text = ""
        computerSelectedNum = Int.random(in: 1...10)
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        guard let numString = numberSelectedLabel.text else {
            introduceLabel.text = "선택 X"
            return
        }
        guard let mySelectedNum = Int(numString) else {
            introduceLabel.text = "선택 X"
            return
        }
        
        
        if computerSelectedNum > mySelectedNum {
            introduceLabel.text = "UP"
        } else if computerSelectedNum < mySelectedNum {
            introduceLabel.text = "DOWN"
        } else {
            introduceLabel.text = "BINGO"
        }
    }
}

