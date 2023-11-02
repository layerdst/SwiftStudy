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
    

    var rpsManager = RPSManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
   
    @IBAction func rpsBtnTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        rpsManager.userGetSelected(name: title)
    }
    

    @IBAction func selecBtnTapped(_ sender: UIButton) {
        myImgView.image = rpsManager.getUserRps().rpsInfo.image
        myChoiceLabel.text = rpsManager.getUserRps().rpsInfo.name
        
        comImgView.image = rpsManager.getComRps().rpsInfo.image
        comChoiceLabel.text = rpsManager.getComRps().rpsInfo.name
        
        mainLabel.text = rpsManager.getRpsResult()
    }
    
    @IBAction func resetBtnTapped(_ sender: UIButton) {
        initView()
    }
    
    fileprivate func initView () {
        mainLabel.text = "선택하세요"
        comImgView.image = rpsManager.getReady().rpsInfo.image
        myImgView.image = rpsManager.getReady().rpsInfo.image
        
        comChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        myChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        rpsManager.allReset()
    }
    

        
}

