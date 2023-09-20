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
    
    var imgArr = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func roleBtnTapped(_ sender: UIButton) {
        firstImgView.image = imgArr.randomElement()
        secondImgView.image = imgArr.randomElement()
        
    }
    

}

