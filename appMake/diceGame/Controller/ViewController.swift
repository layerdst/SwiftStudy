//
//  ViewController.swift
//  DiceGame
//
//  Created by 김재영 on 2023/09/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstImgView: UIImageView!
    @IBOutlet weak var secondImgView: UIImageView!
    
    var diceManager = DiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstImgView.image = diceManager.getFirstDice()
        secondImgView.image = diceManager.getRandomDice()
    }
    
    
    @IBAction func roleBtnTapped(_ sender: UIButton) {
        firstImgView.image = diceManager.getRandomDice()
        secondImgView.image = diceManager.getRandomDice()
    }
    

}

