//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 김재영 on 2023/09/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var myBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        mainLabel.text = "안녕하세요"
        mainLabel.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        //mainLabel.backgroundColor = UIColor.yellow
        myBtn.setTitleColor(.black, for: UIControl.State.normal)
        
    }
    
}

