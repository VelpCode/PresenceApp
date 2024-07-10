//
//  ContentView.swift
//  presence
//
//  Created by Velp on 2024-07-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("London, ON")
                    .font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white).background(Color.red).frame(width: 200, height: 200, alignment: )
                    .
            }
        }
    }
}

#Preview {
    ContentView()
}
