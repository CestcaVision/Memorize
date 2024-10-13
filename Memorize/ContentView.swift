//
//  ContentView.swift
//  Memorize
//
//  Created by 宋亚唯 on 2024/10/13.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🍎", "🎃", "👻", "😊", "🍑", "🍌", "👂"]
    @State var emojiCount = 5
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardsCountAdjuster
        }
        .foregroundColor(.green)
        .padding()
    }
    func cardsCountAdjuster(offset: Int, label: String) -> some View {
        Button(
            action: {
                emojiCount += offset
            },
            label: {
                Image(systemName: label)
            }
        ).disabled(emojiCount + offset < 1 || emojiCount + offset > emojis.count)
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120, maximum: 150))]) {
            ForEach(0..<emojiCount, id: \.self) { index in
                CardView(content: emojis[index]).aspectRatio(2 / 3, contentMode: .fit)
            }
        }
    }
    var cardsCountAdjuster: some View {
        HStack {
            cardsCountAdjuster(offset: -1, label: "minus.circle")
            Spacer()
            Text("Card Count: \(emojiCount)")
            Spacer()
            cardsCountAdjuster(offset: 1, label: "plus.circle")
        }
    }
}
struct CardView: View {
    let content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
