//
//  ContentView.swift
//  Memorize
//
//  Created by Evans, Adam on 10/10/2022.
//

import SwiftUI

struct MemorizeView: View {
    var emojis = ["🚌", "🛻", "🚝", "🚔", "🛴", "🚲", "🏍", "🛺", "🚕"]
    
    @State var emojiCount = 3
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            VStack {
                Image(systemName: "minus.square")   // SystemName found on SF-symbols
            }
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            VStack {
                Image(systemName: "plus.square")
            }
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0..<emojiCount], id:\.self, content: { emoji in
                    CardView(content: emoji)
                })
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        // Applies to all inside the parent view
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true    // @State turn Bool into pointer to external mutable Bool, needed as Views are immutable
    
    var body: some View {
        ZStack {   // ZStack : Stacking outward towards the user
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.stroke(lineWidth: 3)  // Outer rectangle
                shape.fill(.white) // Inner coloured rectangle
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct MemorizeView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeView()
            .preferredColorScheme(.dark)    // Dark mode
        MemorizeView()
            .preferredColorScheme(.light)
    }
}
