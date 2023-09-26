//
//  main.swift
//  RandomBingo
//
//  Created by 김재영 on 2023/09/26.
//

import Foundation

print("Hello, World!")

var comChoice = Int.random(in: 1...100)
var myChoice = 0;
var check = false;

let userInput = {
    let tempInput = readLine()
    guard let stringInput = tempInput else { return }
    guard let numberInput = Int(stringInput) else { return }
    myChoice = numberInput
    
}

func upDown (my : Int, com : Int){
    switch (my-com){
    case 0 :
        print("bingo")
        check = true
    case ..<0 :
        print("업")
        check = false
    default :
        print("다운")
        check = false
    }
}

repeat {
    userInput()
    upDown(my: myChoice, com: comChoice)
}while check == false





