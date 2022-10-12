//
//  MemoriseApp.swift
//  Memorise
//
//  Created by Evans, Adam on 10/10/2022.
//

import SwiftUI

@main
struct MemoriseApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            MemoriseView(viewModel: game)
        }
    }
}
