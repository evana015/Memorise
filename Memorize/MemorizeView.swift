//
//  ContentView.swift
//  Memorize
//
//  Created by Evans, Adam on 10/10/2022.
//

import SwiftUI

struct MemorizeView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        // Applies to all inside the parent view
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true    // @State turn Bool into pointer to external mutable Bool, needed as Views are immutable
    
    var body: some View {
        ZStack {   // ZStack : Stacking outward towards the user
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.stroke(lineWidth: 3)  // Outer rectangle
                shape.fill(.white) // Inner coloured rectangle
                Text("✈️").font(.largeTitle)
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
