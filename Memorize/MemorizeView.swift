//
//  ContentView.swift
//  Memorize
//
//  Created by Evans, Adam on 10/10/2022.
//

import SwiftUI

struct MemorizeView: View {
    @State var emojis = ["🚌", "🛻", "🚝", "🚔", "🛴", "🚲", "🏍", "🛺", "🚕", "✈️", "🚀", "🛸", "🚁", "🛶", "⛴", "⛵️", "🛰", "🚂", "🚋", "🦼"]
    
    @State var emojiCount = 5
    
    var title: some View {
        ZStack {
            let titleBox = RoundedRectangle(cornerRadius: 25)
            titleBox.foregroundColor(.white)
            titleBox.strokeBorder(lineWidth: 3).foregroundColor(.red)
            Text("Memorize!")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color.red)
        }
        .frame(height: 34.0)
    }
    
    var cardGrid: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(emojis[0..<emojiCount], id:\.self, content: { emoji in
                    CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                })
            }
        }
        .foregroundColor(.red)
    }
    
    var animalTheme: some View {
        Button {
            emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐷", "🐸", "🐵", "🐥", "🐣", "🦄"].shuffled()
            emojiCount = 5
        } label: {
            Text("🐼")
        }
    }
    
    var faceTheme: some View {
        Button {
            emojis = ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😛", "😝", "😜", "🤮"].shuffled()
            emojiCount = 5
        } label: {
            Text("😀")
        }
    }
    
    var vehicleTheme: some View {
        Button {
            emojis = ["🚌", "🛻", "🚝", "🚓", "🛴", "🚲", "🏍", "🛺", "🚑", "✈️", "🚀", "🛸", "🚁", "🛶", "⛴", "🚒", "🛰", "🚂", "🚋", "🦼"].shuffled()
            emojiCount = 5
        } label: {
            Text("🚒")
        }
    }
    
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
    
    var bottomControls: some View {
        HStack {
            let label = RoundedRectangle(cornerRadius: 25)
            remove
            VStack{
                ZStack {
                    label.foregroundColor(.white)
                    label.strokeBorder(lineWidth: 2)
                    Text("Pick A Theme!")
                        .font(.footnote)
                }
                .foregroundColor(.red)
                .frame(height: 0.0)
                HStack{
                    vehicleTheme
                    Spacer()
                    faceTheme
                    Spacer()
                    animalTheme
                }
            }
            .padding([.leading, .bottom, .trailing])
            add
        }
        .font(.largeTitle)
        .padding(.horizontal)
    }
    
    var body: some View {
        VStack {
            title
            cardGrid
            bottomControls
        }
        // Applies to all inside the parent view
        .padding(.horizontal)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true    // @State turn Bool into pointer to external mutable Bool, needed as Views are immutable
    
    var body: some View {
        ZStack {   // ZStack : Stacking outward towards the user
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill(.white) // Inner coloured rectangle
                shape.strokeBorder(lineWidth: 3)  // Outer rectangle
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
