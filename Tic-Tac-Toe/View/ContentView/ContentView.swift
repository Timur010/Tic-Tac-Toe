//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by timur on 08.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showGameScreen: Bool = false
    @State private var showSetting: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.mainColor
                    .edgesIgnoringSafeArea(.all)
                
                content
                
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

extension ContentView {
    private var content: some View {
        VStack (spacing: 20){
            
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.top, 80)
                .padding(.bottom, 150)
            
            ButtonView(action: {
                showGameScreen.toggle()
                Constants.singleMode = false
            }, imageName: "person", description: "Одиночная игра")
            
            ButtonView(action: {
                showGameScreen.toggle()
                Constants.singleMode = true
            }, imageName: "person.2", description: "Игра в двоем")
            
            Spacer()

            ButtonView(action: {
                showSetting.toggle()
            }, imageName: "gear", description: "Настройки")
            
            NavigationLink(isActive: $showSetting) {
                SettingView()
            } label: {
                EmptyView()
            }

        }
    }
}
