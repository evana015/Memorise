//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Evans, Adam on 11/10/2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    
    static let emojis = ["🚌", "🛻", "🚝", "🚔", "🛴", "🚲", "🏍", "🛺", "🚕", "✈️", "🚀", "🛸", "🚁", "🛶", "⛴", "⛵️", "🛰", "🚂", "🚋", "🦼"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // @Published automatically will call objectWillChange.send() to update UI
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    // ^ Adds header
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
