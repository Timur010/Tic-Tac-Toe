//
//  WindowVictory.swift
//  Tic-Tac-Toe
//
//  Created by timur on 09.05.2023.
//

import SwiftUI

struct WindowVictory: View {
    var winner: String
    var action: () -> ()
    var body: some View {
       RoundedRectangle(cornerRadius: 16)
            .frame(width: UIScreen.main.bounds.width - 128, height:  UIScreen.main.bounds.height / 5)
            .foregroundColor(.white)
            .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 1)
            .overlay (
                VStack {
                    if winner == "X" {
                        Text("Победили Крестики")
                    } else if winner == "O" {
                        Text ("Победили Нолики")
                    } else {
                        Text ("Ничья")
                    }
                    
                    Button {
                        withAnimation {
                            action()
                        }
                    } label: {
                        Text(NSLocalizedString("Начать заново", comment: ""))
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .padding(10)
                            .padding(.horizontal, 15)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }

                }
            )
            .zIndex(1)
    }
}

struct WindowVictory_Previews: PreviewProvider {
    static var previews: some View {
        WindowVictory(winner: "X", action: ({}))
    }
}
