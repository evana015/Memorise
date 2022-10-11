//
//  MemoryGame.swift
//  Memorize
//
//  Created by Evans, Adam on 11/10/2022.
//

import Foundation

struct MemoryGame<CardContent>{
    var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMathced: Bool
        var content: CardContent
    }
}