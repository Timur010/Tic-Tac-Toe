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
    @AppStorage("crossWins") static var crossWins: Int = 0
    @AppStorage("zeroWins") static var zeroWins: Int = 0
    
}
