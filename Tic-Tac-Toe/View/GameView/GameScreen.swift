//
//  GameScreen.swift
//  Tic-Tac-Toe
//
//  Created by timur on 08.05.2023.
//

import SwiftUI

struct GameScreen: View {
    @StateObject var vm = GameViewModel()
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            Color.mainColor
                .edgesIgnoringSafeArea(.all)
            if vm.gameEnded {
                WindowVictory(winner: vm.winner) {
                    vm.resetGame()
                } closing: {
                    presentation.wrappedValue.dismiss()
                }
            }
            
            VStack (spacing: 1) {
                
                header
                
                Text("Tic-Tac-Toe")
                    .font(.system(size: 20))
                    .foregroundColor(.textColor)
                    .bold()
                
                scoreboard
                
                Spacer()
                ForEach(vm.ranges, id: \.self) { renge in
                    HStack (spacing: 1){
                        ForEach(renge, id: \.self) { index in
                            ButtonXO(title: $vm.moves[index])
                                .onTapGesture {
                                    vm.playerTabX(index: index)
                                    if Constants.singleMode {
                                        vm.crossMove.toggle()
                                    }
                                }
                        }
                    }
                }
                Spacer()
                
                ButtonView(action: {
                    vm.resetGame()
                }, imageName: "memories", description: "начать заново")

            }
            .navigationBarBackButtonHidden(true)
            .background(Color.mainColor)
            .blur(radius: vm.gameEnded ? 5 : 0)
            .disabled(vm.gameEnded ? true : false)
            
        }
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}


extension GameScreen {
    private var header: some View {
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
    }
    private var scoreboard: some View {
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
                Text("\(vm.currentAccountX)")
                    .foregroundColor(.textColor)
                    .bold()
                    .font(.system(size: 30))
                Spacer()
                Text("\(vm.currentAccountO)")
                    .foregroundColor(.blue)
                    .bold()
                    .font(.system(size: 30))
            }
            .padding(.horizontal, 85)
        }
    }
}
