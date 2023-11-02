//
//  RPS.swift
//  RPSGame
//
//  Created by 김재영 on 2023/09/20.
//

import UIKit

enum Rps : Int {
    case ready
    case rock
    case paper
    case scissors
    
    var rpsInfo : (image : UIImage, name : String){
        switch self {
        case .ready :
            return ( #imageLiteral(resourceName : "ready") , "준비")
        case .rock :
            return ( #imageLiteral(resourceName : "rock") , "주먹")
        case .paper :
            return ( #imageLiteral(resourceName : "paper") , "보")
        case .scissors :
            return ( #imageLiteral(resourceName : "scissors") , "가위")
        }
    }
}
