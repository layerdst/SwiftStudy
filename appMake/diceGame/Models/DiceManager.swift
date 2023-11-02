//
//  DiceManager.swift
//  DiceGame
//
//  Created by 김재영 on 2023/11/02.
//

import UIKit

struct DiceManager{
    private var diceArr : [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    func getRandomDice() -> UIImage {
        return diceArr.randomElement()!
    }
    
    func getFirstDice() -> UIImage {
        return diceArr[0]
    }
    
                    
}
