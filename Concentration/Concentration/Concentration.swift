//
//  Concentration.swift
//  Concentration
//
//  Created by Mathews Fazza on 4/18/19.
//  Copyright © 2019 Matt Fazza. All rights reserved.
//

import Foundation

class Concentration {
    
    //could have an init method too, but I'll leave this array empty and uninitialized
    var cards = Array<Card>()
    //var cards = [Card]()
    
    func chooseCard(at index: Int){
        
    }
    
    init(numberOfPairsOfCards: Int){
        
        //lookup loop syntax on swift
        //for identifier in 0..<numberOfPairsOfCards{
        
        for _ in 1...numberOfPairsOfCards{
            let card = Card(identifier: identifier)
            /*
            let matchingCard = card
            cards.append(card)
            cards.append(card)
            is the same as */
            cards += [card, card]
        }
        //TODO: Shuffle cards
    }
    
}
