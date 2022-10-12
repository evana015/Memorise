//
//  MemoriseView.swift
//  Memorise
//
//  Created by Evans, Adam on 10/10/2022.
//

import SwiftUI

struct MemoriseView: View {
    let viewModel: EmojiMemoryGame
    
    var Title: some View {
        ZStack {
            let titleBox = RoundedRectangle(cornerRadius: 25)
            titleBox.foregroundColor(.white)
            titleBox.strokeBorder(lineWidth: 3).foregroundColor(.red)
            Text("Memorise!")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color.red)
        }
        .frame(height: 34.0)
    }
    
    var CardGrid: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
        .foregroundColor(.red)
    }
    
    var body: some View {
        VStack {
            Title
            CardGrid
        }
        // Applies to all inside the parent view
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {   // ZStack : Stacking outward towards the user
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill(.white) // Inner coloured rectangle
                shape.strokeBorder(lineWidth: 3)  // Outer rectangle
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}

struct MemoriseView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        MemoriseView(viewModel: game)
            .preferredColorScheme(.dark)    // Dark mode
        MemoriseView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
