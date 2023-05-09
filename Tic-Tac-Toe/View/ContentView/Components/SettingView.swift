//
//  SettingView.swift
//  Tic-Tac-Toe
//
//  Created by timur on 09.05.2023.
//

import SwiftUI

struct SettingView: View {
    @StateObject var vm = SettingViewModel()
    var body: some View {
        ScrollView {
            Text ("Настройки игрока")
            Divider()
            HStack {
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
                    .padding(.top, 20)

                }
                .padding(5)
                
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
                    .padding(.top, 20)
                }
                .padding(5)
                
                
            }
            
            Text ("Настройки игры")
            Divider()
            
            
            
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
