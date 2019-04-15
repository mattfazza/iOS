//
//  ViewController.swift
//  Concentration
//
//  Created by Mathews Fazza on 4/15/19.
//  Copyright © 2019 Matt Fazza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0
    //var flipCount: Int = 0 is the same thing *could be initialized with a initializer as well, but iheritance makes it a bit tricky

    //directive + func keyword + name of function(_ and sender are names of the parameter: UIButton is the type) *_ means no arg since it's an internal ios who is sending it
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        flipCard(withEmoji: "🐛", on: sender) //notice that the argument name "on" matches the external argument name on the function definition
    }
    
    @IBAction func touchSecondCard(_ sender: UIButton) {
        flipCount += 1
        flipCard(withEmoji: "🐜", on: sender)
    }
    
    //internal name is emoji, withEmoji is the external one for the caller
    func flipCard(withEmoji emoji: String, on button: UIButton){
        print("flipCard(withEmoji: \(emoji)")
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.714150488, green: 0.6348293042, blue: 1, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }//end of flipCard
    
    
    

    
}

