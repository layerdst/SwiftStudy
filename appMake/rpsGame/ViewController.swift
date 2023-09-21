//
//  ViewController.swift
//  RPSGame
//
//  Created by 김재영 on 2023/09/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var comImgView: UIImageView!
    @IBOutlet weak var myImgView: UIImageView!
    
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var imgArr = [Rps.rock : #imageLiteral(resourceName: "ready") , Rps.paper : #imageLiteral(resourceName: "paper"), Rps.scissors : #imageLiteral(resourceName: "scissors") ]
    var stringRps = ["가위" : Rps.scissors, "바위" : Rps.rock, "보" : Rps.paper]
                                                    
    var myChoice : Rps = Rps.rock
    var comChoice : Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
   
    @IBAction func rpsBtnTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        myChoice = stringRps[title]!
    }
    

    @IBAction func selecBtnTapped(_ sender: UIButton) {
        myImgView.image = imgArr[myChoice]
        comImgView.image = imgArr[comChoice]
        
        setLabelText(choice: myChoiceLabel, myChoice)
        setLabelText(choice: comChoiceLabel, comChoice)
        
        vs(comChoice, myChoice)
    }
    
    @IBAction func resetBtnTapped(_ sender: UIButton) {
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        initView()
    }
    
    fileprivate func initView () {
        comImgView.image = #imageLiteral(resourceName: "ready")
        myImgView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
    }
    
    
    fileprivate func setLabelText(choice : UILabel!, _ rps: Rps) {
        let result = stringRps.filter { $0.value == rps }
        comChoiceLabel.text = result.keys.joined()
    }
    
    fileprivate func vs(_ com : Rps, _ my : Rps){
        
        if com == my {
            mainLabel.text = "비김"
        }else if com == Rps.rock && my == Rps.paper {
            mainLabel.text = "이김"
        }else if com == Rps.paper && my == Rps.scissors {
            mainLabel.text = "이김"
        }else if com == Rps.scissors && my == Rps.rock {
            mainLabel.text = "이김"
        }else {
            mainLabel.text = "짐"
        }
    }
    
    
    
    
    

        
        
}

