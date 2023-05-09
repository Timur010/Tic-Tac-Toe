//
//  GameViewModel.swift
//  Tic-Tac-Toe
//
//  Created by timur on 09.05.2023.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var moves = ["","","","","","","","",""]
    @Published var ranges = [(0..<3),(3..<6),(6..<9)]
    @Published var winner = ""
    @Published var gameEnded = false
    @Published var crossMove: Bool = true
    @Published var currentAccountX: Int = 0
    @Published var currentAccountO: Int = 0

    
    func playerTabX(index: Int) {
        if moves[index] == "", !gameEnded  {
            if !crossMove {
                moves[index] = "O"
            } else {
                moves[index] = "X"
            }
            
        }
        
        for value in ["X", "O"] {
            if checkWinner(list: moves, values: value) {
                if value == "X" {
                    Constants.crossWins += 1
                    currentAccountX += 1
                } else if value == "O"{
                    Constants.zeroWins += 1
                    currentAccountO += 1
                }
                withAnimation {
                    gameEnded = true
                }
                winner = value
            }
        }
        
        if !gameEnded, !Constants.singleMode {
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
            
            for value in ["X", "O"] {
                if checkWinner(list: moves, values: value) {
                    withAnimation {
                        gameEnded = true
                    }
                    winner = value
                }
            }
        } else {
            withAnimation {
                gameEnded = true
            }
        }
    }
    
    func checkWinner(list: [String], values: String) -> Bool {
        let winningSequences = [
            [ 0, 1, 2 ], [ 3, 4, 5 ], [ 6, 7, 8 ],
            [ 0, 4, 8 ], [ 2, 4, 6 ],
            [ 0, 3, 6 ], [ 1, 4, 7 ], [ 2, 5, 8 ],
        ]
        
        for sequence in winningSequences {
            var score = 0
            
            for match in sequence {
                if list[match] == values {
                    score += 1
                }
                
                if score == 3 {
                    return true
                }
            }
        }
        return false
    }
    
    func resetGame() {
        withAnimation {
            gameEnded = false
            moves = ["","","","","","","","",""]
            winner = ""
            crossMove = true
        }
        
    }
}
