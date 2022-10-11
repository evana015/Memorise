//
//  MemoriseView.swift
//  Memorise
//
//  Created by Evans, Adam on 10/10/2022.
//

import SwiftUI

struct MemoriseView: View {
    @State var emojis = ["🚌", "🛻", "🚝", "🚔", "🛴", "🚲", "🏍", "🛺", "🚕", "✈️", "🚀", "🛸", "🚁", "🛶", "⛴", "⛵️", "🛰", "🚂", "🚋", "🦼"]
    
    @State var emojiCount = 5
    
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
                ForEach(emojis[0..<emojiCount], id:\.self, content: { emoji in
                    CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                })
            }
        }
        .foregroundColor(.red)
    }
    
    var AnimalTheme: some View {
        Button {
            emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐷", "🐸", "🐵", "🐥", "🐣", "🦄"].shuffled()
            emojiCount = 5
        } label: {
            Text("🐼")
        }
    }
    
    var FaceTheme: some View {
        Button {
            emojis = ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😛", "😝", "😜", "🤮"].shuffled()
            emojiCount = 5
        } label: {
            Text("😀")
        }
    }
    
    var VehicleTheme: some View {
        Button {
            emojis = ["🚌", "🛻", "🚝", "🚓", "🛴", "🚲", "🏍", "🛺", "🚑", "✈️", "🚀", "🛸", "🚁", "🛶", "⛴", "🚒", "🛰", "🚂", "🚋", "🦼"].shuffled()
            emojiCount = 5
        } label: {
            Text("🚒")
        }
    }
    
    var BottomControls: some View {
        HStack {
            let label = RoundedRectangle(cornerRadius: 25)
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
                    VehicleTheme
                    Spacer()
                    FaceTheme
                    Spacer()
                    AnimalTheme
                }
            }
            .padding([.leading, .bottom, .trailing])
        }
        .font(.largeTitle)
        .padding(.horizontal)
    }
    
    var body: some View {
        VStack {
            Title
            CardGrid
            BottomControls
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

struct MemoriseView_Previews: PreviewProvider {
    static var previews: some View {
        MemoriseView()
            .preferredColorScheme(.dark)    // Dark mode
        MemoriseView()
            .preferredColorScheme(.light)
    }
}