//
//  Card.swift
//  Concentration
//
//  Created by Mathews Fazza on 4/18/19.
//  Copyright © 2019 Matt Fazza. All rights reserved.
//

import Foundation

//unlike C classes in swift are very different than classes: they have no inheritance and they are value types (instead of reference types)
struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return identifierFactory
        
    }
    
    //inits tend fo have the external and the internal name being the same
    init(identifier: Int){
        self.identifier = identifier
    }
    
}
