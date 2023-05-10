//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by timur on 08.05.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = SettingViewModel()
    @StateObject var vm = GameViewModel()
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
                        .environmentObject(vm)
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
                vm.modeSelection()
            }, imageName: "person", description: "Одиночная игра")
            
            ButtonView(action: {
                showGameScreen.toggle()
                Constants.singleMode = true
                vm.modeSelection()
            }, imageName: "person.2", description: "Игра в двоем")
            
            Spacer()

            ButtonView(action: {
                showSetting.toggle()
                viewModel.gameModeAssignment()
            }, imageName: "gear", description: "Настройки")
            
            NavigationLink(isActive: $showSetting) {
                SettingView()
                    .environmentObject(viewModel)
            } label: {
                EmptyView()
            }

        }
    }
}
