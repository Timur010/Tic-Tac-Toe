//
//  Button.swift
//  Tic-Tac-Toe
//
//  Created by timur on 09.05.2023.
//

import SwiftUI

struct ButtonView: View {
    var action: () -> ()
    var imageName: String
    var description: String
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: imageName)
            Text(description)
                .foregroundColor(.textColor)
                .font(.system(size: 20))
                .bold()
        }
        .padding(11)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 2)
                .foregroundColor(.lineColor)
        )
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(action: ({}), imageName: "", description: "")
    }
}
