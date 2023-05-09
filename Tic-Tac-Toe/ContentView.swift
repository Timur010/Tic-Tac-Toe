//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by timur on 08.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showGameScreen: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.mainColor
                    .edgesIgnoringSafeArea(.all)
                
                VStack (spacing: 20){
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.top, 80)
                        .padding(.bottom, 150)
                        
                   
                    Button {
                        showGameScreen.toggle()
                        Constants.singleMode = false
                    } label: {
                        Image(systemName: "person")
                        Text("Одиночная игра")
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
                    
                    Button {
                        showGameScreen.toggle()
                        Constants.singleMode = true
                    } label: {
                        Image(systemName: "person.2")
                        Text("Игра в двоем")
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
                    Spacer()

                }
                NavigationLink(isActive: $showGameScreen) {
                    GameScreen()
                } label: {
                    EmptyView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
