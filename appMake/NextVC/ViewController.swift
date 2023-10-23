//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {

        let firstVC = FirstViewController()
        firstVC.someString = "화면이동"
        firstVC.modalPresentationStyle = .fullScreen
        present(firstVC, animated: false)
        
        
        
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        
        secondVC.someString = "두번째화면"
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true)
        
        
        
        
    }
    
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    // 아래의 조건문은 타 조건에 의해서 세그웨이를 실행여부를 판단하기 위함임, shoudPerformSegue 와 비슷하기 때문에 굳이 shouldPerformSegue 가 실행될 필요가 없음
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        
        if num < 5 {
            performSegue(withIdentifier: "toThirdVC", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            guard let thirdVC = segue.destination as? ThirdViewController else { return }
            thirdVC.someString = "세먼째화면"
        }
        
        if segue.identifier == "toFourthVC" {
            guard let fouthVC = segue.destination as? FourthViewController else { return }
            fouthVC.someString = "네번째 화면"
        }
    }
    
    
    var num = 7
    
    // 세그웨이 실행여부를 판단할 수 있는 메소드 - 버튼에서 뷰의 세그웨이에만 있는 세그웨이
    // 해당 메서드는 num 의 숫자에 따라서 아래의 메서드의 실행여부를 판단함
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if num > 5 {
            return false
        }
        return true
    }
    

    
}

