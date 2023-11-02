//
//  RPSManager.swift
//  RPSGame
//
//  Created by 김재영 on 2023/11/02.
//

import UIKit

struct RPSManager{
    private var comChoice : Rps = Rps(rawValue: Int.random(in: 1...3))!
    private var myChoice : Rps = Rps(rawValue: Int.random(in: 1...3))!
    
    func getReady()->Rps {
        return Rps.ready
    }
    
    func getUserRps() -> Rps {
        return myChoice
    }
    
    func getComRps() -> Rps {
        return comChoice
    }
    
    mutating func userGetSelected(name : String) {
        switch name {
        case "가위" :
            myChoice = Rps.scissors
        case "바위" :
            myChoice = Rps.rock
        case "보" :
            myChoice = Rps.paper
        default :
            myChoice = Rps.rock
        }
    }
    
    func getRpsResult() -> String {
        let com = comChoice
        let my = myChoice
        
        if com == my {
            return "비김"
        }else if com == Rps.rock && my == Rps.paper {
            return "이김"
        }else if com == Rps.paper && my == Rps.scissors {
            return "이김"
        }else if com == Rps.scissors && my == Rps.rock {
            return "이김"
        }else {
            return "짐"
        }
    }
    
    mutating func allReset (){
        comChoice = Rps(rawValue: Int.random(in: 1...3))!
        myChoice = Rps(rawValue: Int.random(in: 1...3))!
    }
    
    
}
