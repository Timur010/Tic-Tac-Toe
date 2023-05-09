//
//  SettingViewModel.swift
//  Tic-Tac-Toe
//
//  Created by timur on 09.05.2023.
//

import SwiftUI

class SettingViewModel: ObservableObject {
    @Published var nameUserX: String = Constants.nameUserX
    @Published var nameUserO: String = Constants.nameUserO
    
    func saved () {
        Constants.nameUserX = self.nameUserX
        Constants.nameUserO = self.nameUserO
    }
}
