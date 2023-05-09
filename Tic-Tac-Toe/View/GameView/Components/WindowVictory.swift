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
    var closing: () -> ()
    
    var body: some View {
        
       RoundedRectangle(cornerRadius: 16)
            .frame(width: UIScreen.main.bounds.width - 128, height:  UIScreen.main.bounds.height / 5)
            .foregroundColor(.mainColor)
            .shadow(color: .black.opacity(0.3), radius: 15, x: 0, y: 1)
            .overlay (
                VStack {
                    
                    if winner == "X" {
                        Text("Победили Крестики!")
                            .foregroundColor(.textColor)
                            .bold()
                            .padding(.top, 15)
                    } else if winner == "O" {
                        Text ("Победили Нолики!")
                            .foregroundColor(.textColor)
                            .bold()
                            .padding(.top, 15)
                    } else {
                        Text ("Ничья")
                            .foregroundColor(.textColor)
                            .bold()
                            .padding(.top, 15)
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            action()
                        }
                    } label: {
                        Text(NSLocalizedString("Начать заново", comment: ""))
                            .bold()
                            .foregroundColor(.gray)
                            .padding(10)
                            .background(Color.mainColor)
                            .cornerRadius(10)

                    }
                    .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 1)
                    
                    Button {
                        closing()
                    } label: {
                        Text(NSLocalizedString("главное меню", comment: ""))
                            .bold()
                            .font(.system(size: 18))
                            .foregroundColor(.mainColor)
                            .padding(10)
                            .background(Color.lineColor)
                            .cornerRadius(10)
                    }
                    .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 1)
                    
                    Spacer()
                }
            )
            .zIndex(1)
    }
}

struct WindowVictory_Previews: PreviewProvider {
    static var previews: some View {
        WindowVictory(winner: "X", action: ({}), closing: ({}))
    }
}
