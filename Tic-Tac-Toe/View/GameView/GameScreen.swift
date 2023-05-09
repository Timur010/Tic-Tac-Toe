//
//  GameScreen.swift
//  Tic-Tac-Toe
//
//  Created by timur on 08.05.2023.
//

import SwiftUI

struct GameScreen: View {
    @Environment(\.presentationMode) var presentation
    @State private var moves = ["","","","","","","","",""]
    @State private var gameEnded = false
    @State var crossMove: Bool = true
    @State private var winner = "Ничья"
    private var ranges = [(0..<3),(3..<6),(6..<9)]
    
    var body: some View {
        ZStack {
            Color.mainColor
                .edgesIgnoringSafeArea(.all)
            if gameEnded {
                WindowVictory(winner: winner) {
                    resetGame()
                } closing: {
                    presentation.wrappedValue.dismiss()
                }
            }
            
            VStack (spacing: 1) {
                HStack {
                    Button {
                        presentation.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "house")
                            .resizable()
                            .frame(width: 25, height: 23)
                            .padding(.bottom, 15)
                            .foregroundColor(.textColor)
                    }

                    
                    
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.bottom, 15)
                    
                    Spacer()
                    
                    Button {

                    } label: {
                        Image(systemName: "questionmark")
                            .resizable()
                            .frame(width: 15, height: 25)
                            .padding(.bottom, 15)
                            .foregroundColor(.blue)
                    }
                    
                }
                .padding(.horizontal, 30)
                
                Text("Tic-Tac-Toe")
                    .font(.system(size: 20))
                    .foregroundColor(.textColor)
                    .bold()
                
                VStack {
                    Text("Счет")
                        .foregroundColor(.lineColor)
                        .font(.system(size: 20))
                        .bold()
                        .padding(.top, 10)
                    HStack {
                        Text("Тиму X")
                            .foregroundColor(.textColor)
                            .bold()
                            .font(.system(size: 25))
                            .lineLimit(1)
                        Spacer()
                        Text("Шарап O")
                            .foregroundColor(.blue)
                            .bold()
                            .lineLimit(1)
                            .font(.system(size: 25))
                    }
                    .padding(.horizontal, 50)
                    
                    HStack {
                        Text("\(Constants.crossWins)")
                            .foregroundColor(.textColor)
                            .bold()
                            .font(.system(size: 30))
                        Spacer()
                        Text("\(Constants.zeroWins)")
                            .foregroundColor(.blue)
                            .bold()
                            .font(.system(size: 30))
                    }
                    .padding(.horizontal, 85)
                }
                
                Spacer()
                ForEach(ranges, id: \.self) { renge in
                    HStack (spacing: 1){
                        ForEach(renge, id: \.self) { index in
                            ButtonXO(title: $moves[index])
                                .onTapGesture {
                                    playerTabX(index: index)
                                    if Constants.singleMode {
                                        crossMove.toggle()
                                    }
                                }
                        }
                    }
                }
                Spacer()
                
                ButtonView(action: {
                    resetGame()
                }, imageName: "memories", description: "начать заново")

            }
            .navigationBarBackButtonHidden(true)
            .background(Color.mainColor)
            .blur(radius: gameEnded ? 5 : 0)
            .disabled(gameEnded ? true : false)
            
        }
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}


extension GameScreen {
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
                } else if value == "O"{
                    Constants.zeroWins += 1
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




