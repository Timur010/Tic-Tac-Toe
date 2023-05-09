//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by timur on 08.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: GameScreen()) {
                Text("Начать игру")
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                    .bold()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
