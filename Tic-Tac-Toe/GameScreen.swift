//
//  GameScreen.swift
//  Tic-Tac-Toe
//
//  Created by timur on 08.05.2023.
//

import SwiftUI

struct GameScreen: View {
    @State private var moves = ["","","","","","","","",""]
    private var ranges = [(0..<3),(3..<6),(6..<9)]
    
    var body: some View {
        VStack (spacing: 1) {
            ForEach(ranges, id: \.self) { renge in
                HStack (spacing: 1){
                    ForEach(renge, id: \.self) { index in
                        ButtonXO(title: $moves[index])
                            .onTapGesture {
                                playerTabX(index: index)
                            }
                    }
                }
            }
        }
        .background(Color.gray)
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}

extension GameScreen {
    func playerTabX(index: Int) {
        if moves[index] == "" {
            moves[index] = "X"
            botMove()
        }
    }
    
    func botMove() {
        var availableMoves: [Int] = []
        var movesLeft = 0
        
        for move in moves {
            if move == "" {
                availableMoves.append(movesLeft)
            }
            movesLeft += 1
        }
        
        if availableMoves.count != 0 {
            moves[availableMoves.randomElement()!] = "O"
        }
    }
}




