//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Evans, Adam on 11/10/2022.
//

import SwiftUI

class EmojiMemoryGame {
    
    static let emojis = ["🚌", "🛻", "🚝", "🚔", "🛴", "🚲", "🏍", "🛺", "🚕", "✈️", "🚀", "🛸", "🚁", "🛶", "⛴", "⛵️", "🛰", "🚂", "🚋", "🦼"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
