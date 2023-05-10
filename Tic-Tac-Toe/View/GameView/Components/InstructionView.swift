//
//  InstructionView.swift
//  Tic-Tac-Toe
//
//  Created by timur on 10.05.2023.
//

import SwiftUI

struct InstructionView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .frame(width: UIScreen.main.bounds.width - 100, height:  UIScreen.main.bounds.height / 1.8)
             .foregroundColor(.mainColor)
             .shadow(color: .black.opacity(0.3), radius: 15, x: 0, y: 1)
             .overlay (
                VStack {
                    Text("Крестики-нолики — логическая игра между двумя противниками на квадратном поле 3 на 3 клетки или большего размера (вплоть до «бесконечного поля»). Один из игроков играет «крестиками», второй — «ноликами»")
                        .padding()
                        .font(.system(size: 14))
                        .foregroundColor(.textColor)
                    Text("Игроки по очереди ставят на свободные клетки поля 3×3 знаки (один всегда крестики, другой всегда нолики). Первый, выстроивший в ряд 3 своих фигуры по вертикали, горизонтали или большой диагонали, выигрывает. Если игроки заполнили все 9 ячеек и оказалось, что ни в одной вертикали, горизонтали или большой диагонали нет трёх одинаковых знаков, партия считается закончившейся в ничью")
                        .padding()
                        .font(.system(size: 14))
                        .foregroundColor(.textColor)
                }
            )
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
    }
}
