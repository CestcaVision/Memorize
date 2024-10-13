//
//  ContentView.swift
//  Memorize
//
//  Created by 宋亚唯 on 2024/10/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.green)
        .padding()
    }
}
struct CardView: View {
    @State var isFaceUp = false
    var body: some View {
        let base = Circle()
        ZStack {
            if isFaceUp {
                base.fill(.white)
                base.stroke(lineWidth: 3)
                Text("🚗")
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
