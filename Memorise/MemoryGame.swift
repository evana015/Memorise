//
//  MemoryGame.swift
//  Memorise
//
//  Created by Evans, Adam on 11/10/2022.
//

import Foundation

struct MemoryGame<CardContent>{
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // Fix
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        // add numberOfPairsOfCards x2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMathced: Bool = false
        var content: CardContent
        var id: Int
    }
}
