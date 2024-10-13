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
    var isFaceUp: Bool = false
    var body: some View {
        if isFaceUp {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                Text("🚗")
                    .font(.largeTitle)
            }
        } else {
            RoundedRectangle(cornerRadius: 20)
        }
    }
}

#Preview {
    ContentView()
}
