//
//  ContentView.swift
//  Memorize
//
//  Created by 宋亚唯 on 2024/10/13.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🍎", "🎃", "👻", "😊", "🍑"]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
            }
        }
        .foregroundColor(.green)
        .padding()
    }
}
struct CardView: View {
    let content: String
    @State var isFaceUp = false
    var body: some View {
        let base = Circle()
        ZStack {
            if isFaceUp {
                base.fill(.white)
                base.stroke(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
