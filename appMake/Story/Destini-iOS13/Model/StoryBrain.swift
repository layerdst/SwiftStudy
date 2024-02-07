//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    
    let story = [
        Story(title: "You see a fork in the road ", choice1: "Take a left", choice2: "Take a right"),
        Story(title: "You see a tiger", choice1: "Shout a help", choice2:  "Play dead"),
        Story(title: "You find a treasure chest", choice1: "Opne it", choice2: "Check fo traps")
    ]
    
    var storyNumber = 1
    
    mutating func nextStory(choice : String){
        
        switch (storyNumber, choice) {
        case (0, "Take a left") :
            storyNumber = 1
            print("case0")
        case (0, "Take a right") :
            print("case2")
            storyNumber = 2
        default :
            storyNumber = 0
        }
    }
    
    
    func displayStory () -> Story {
        return story[storyNumber]
    }
}
