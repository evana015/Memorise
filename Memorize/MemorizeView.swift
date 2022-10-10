//
//  ContentView.swift
//  Memorize
//
//  Created by Evans, Adam on 10/10/2022.
//

import SwiftUI

struct MemorizeView: View {
    var body: some View {
        ZStack {   // ZStack : Stacking outward towards the user
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
            Text("Hello")
        }
        // Applies to all inside the ZStack
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct MemorizeView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeView()
    }
}
