//
//  ButtonXO.swift
//  Tic-Tac-Toe
//
//  Created by timur on 09.05.2023.
//

import SwiftUI

struct ButtonXO: View {
    @Binding var title: String
    var body: some View {
        HStack {
            Text("\(title)")
                .font(.system(size: 40))
                .padding(20)
        }
        .frame(width: 100, height: 100)
        .background(Color.white)
    }
}

struct ButtonXO_Previews: PreviewProvider {
    static var previews: some View {
        ButtonXO(title: .constant("x"))
    }
}
