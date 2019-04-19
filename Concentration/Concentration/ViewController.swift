//
//  ViewController.swift
//  Concentration
//
//  Created by Mathews Fazza on 4/15/19.
//  Copyright © 2019 Matt Fazza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //classes get a free init as long as all of their vars are initialized
    //without lazy, the line above wouldn't be able to use cardButtons (it hasn't been initialized yet)
    //lazy cannot have a didSet though
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)  / 2)
    
    var emojiChoices = ["🐝", "🦂", "🕷", "🦗", "🐛", "🐜", "🐞", "🦟"]
    
    //var flipCount: Int = 0 is the same thing *could be initialized with a initializer as well, but iheritance makes it a bit tricky
    var flipCount = 0 {
        //property observer
        didSet { flipCountLabel.text = "Flips: \(flipCount)" }
    }
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    //directive + func keyword + name of function(_ and sender are names of the parameter: UIButton is the type) *_ means no arg since it's an internal ios who is sending it
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        //let cardNumber = cardButtons.index(of: sender)!  is the alternative syntax for
        if let cardNumber = cardButtons.index(of: sender){
        
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender) is replaced by
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("the chosen card was not in card buttons")
        }
        
        //flipCard(withEmoji: "🐛", on: sender) //notice that the argument name "on" matches the external argument name on the function definition
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.714150488, green: 0.6348293042, blue: 1, alpha: 0) : #colorLiteral(red: 0.714150488, green: 0.6348293042, blue: 1, alpha: 1)
            }
        }
    }
    
    //dictionary
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        //if you don't set it with if, the type of chosenEmoji will be an optional
        /* another way to write this is noted below
        if chosenEmoji != nil {
            return emoji[card.identifier]!
        } else {
            return "?"
        }
        */
        
        return emoji[card.identifier] ?? "?"
    }
    
    /*
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
    */
}

