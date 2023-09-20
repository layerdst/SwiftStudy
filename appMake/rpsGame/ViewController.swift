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
                                                    
    var myChoice : Rps = Rps.rock
    var comChoice : Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        comImgView.image = #imageLiteral(resourceName: "ready")
        myImgView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        
    }
    
    fileprivate func setLabelText(choice : UILabel!, _ rps: Rps) {
        switch rps {
        case .rock :
            choice.text = "바위"
        case .paper :
            choice.text = "보"
        case .scissors :
            choice.text = "가위"
        }
    }
    
    @IBAction func rpsBtnTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
            
    }
    

    @IBAction func selectBtnTapped(_ sender: UIButton) {
        comImgView.image = imgArr[comChoice]
        setLabelText(choice: comChoiceLabel, comChoice)
    }
    
    @IBAction func resetBtnTapped(_ sender: UIButton) {
        
        
    }
    

        
        
}

