//
//  ViewController.swift
//  Concentration
//
//  Created by Mathews Fazza on 4/15/19.
//  Copyright © 2019 Matt Fazza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var flipCount = 0 {
        //property observer
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    //var flipCount: Int = 0 is the same thing *could be initialized with a initializer as well, but iheritance makes it a bit tricky
    
    //array of card buttons
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["🐝", "🦂", "🕷", "🦗", "🐛", "🐜", "🐞", "🦟", "🐝", "🦂", "🕷", "🦗", "🐛", "🐜", "🐞", "🦟"]
    
    //directive + func keyword + name of function(_ and sender are names of the parameter: UIButton is the type) *_ means no arg since it's an internal ios who is sending it
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        //let cardNumber = cardButtons.index(of: sender)!  is the alternative syntax for
        if let cardNumber = cardButtons.index(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            print("card number: \(cardNumber)")
        }else{
            print("the chosen card was not in card buttons")
        }
        
        //flipCard(withEmoji: "🐛", on: sender) //notice that the argument name "on" matches the external argument name on the function definition
    }
    
    
    //internal name is emoji, withEmoji is the external one for the caller
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.714150488, green: 0.6348293042, blue: 1, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }//end of flipCard
    
}

