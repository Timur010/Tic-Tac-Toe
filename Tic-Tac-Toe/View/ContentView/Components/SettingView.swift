//
//  SettingView.swift
//  Tic-Tac-Toe
//
//  Created by timur on 09.05.2023.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var vm: SettingViewModel
    var body: some View {
        ScrollView {
            Text ("Настройки игрока")
                .foregroundColor(.black)
            Divider()
            HStack {
                XSetting
                
                OSetting
            }
            Text ("Настройки игры")
                .foregroundColor(.black)
            Divider()
            
            Text("выберите раскладку")
                .foregroundColor(.black)
            HStack {
                Image("3X3")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(4)
                    .onTapGesture {
                        Constants.gameMode = false
                        vm.gameMode = false
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(vm.gameMode ? .mainColor : .lineColor)
                    )
                Image("4X4")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        Constants.gameMode = true
                        vm.gameMode = true
                    }
                    .padding(4)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(vm.gameMode ? .lineColor : .mainColor)
                    )
            }
            Spacer()
        }
        .padding()
        .background(Color.mainColor)
        .navigationTitle("Настройки")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

extension SettingView {
    private var XSetting: some View {
        VStack {
            Text ("X")
                .foregroundColor(.textColor)
                .font(.system(size: 30))
                .bold()
            
            TextField("Имя Игрока", text: $vm.nameUserX, onEditingChanged: { changed in
                if !changed {
                    vm.saved()
                }
                
            })
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.lineColor)
                )
            Text("Количество побед:")
                .padding(.top, 10)
                .foregroundColor(.textColor)
                .font(.system(size: 14))
            Text(" \(Constants.crossWins)")
                .foregroundColor(.textColor)
                .font(.system(size: 40))
                .bold()
                .padding(.top, 18)
            
            Button {
                Constants.crossWins = 0
            } label: {
                Text("Сбросить")
                    .foregroundColor(Color.textColor)
                Image(systemName: "goforward")
                    
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.lineColor)
            )
            .padding(.top, 10)

        }
        .padding(5)
    }
    private var OSetting: some View {
        VStack {
            Text ("O")
                .foregroundColor(.blue)
                .font(.system(size: 30))
                .bold()
            
            TextField("Имя Игрока", text: $vm.nameUserO, onEditingChanged: { changed in
                if !changed {
                    vm.saved()
                }
            })
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.lineColor)
                )
            Text("Количество побед:")
                .foregroundColor(.blue)
                .font(.system(size: 14))
                .padding(.top, 10)
            Text("\(Constants.zeroWins)")
                .foregroundColor(.blue)
                .font(.system(size: 40))
                .bold()
                .padding(.top, 18)
            
            Button {
                Constants.zeroWins = 0
            } label: {
                Text("Сбросить")
                    .foregroundColor(Color.blue)
                Image(systemName: "goforward")
                    .foregroundColor(Color.textColor)
                    
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.lineColor)
            )
            .padding(.top, 10)
        }
        .padding(5)
    }
}
