//
//  Constants.swift
//  Tic-Tac-Toe
//
//  Created by timur on 09.05.2023.
//

import SwiftUI

struct Constants {
    static var singleMode: Bool = false
    @Binding var showSetting: Bool
    @AppStorage("gameMode") static var gameMode: Bool = false
    @AppStorage("crossWins") static var crossWins: Int = 0
    @AppStorage("zeroWins") static var zeroWins: Int = 0
    @AppStorage("nameX") static var nameUserX: String = "User"
    @AppStorage("nameO") static var nameUserO: String = "User"
    
}
