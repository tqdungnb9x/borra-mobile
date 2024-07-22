//
//  AppColors.swift
//  HomeWidgetsExtension
//
//  Created by smartee on 24/08/2023.
//

import Foundation
import SwiftUI

struct AppColors {
    static let blue = Color.blue
    static let cadetBlue = Color(hex: 0xffAEB1BB)
    static let white = Color.white
    static let salmon = Color(hex: 0xffFF8074)
    static let pastelOrange = Color(hex: 0xffFFBA52)
    static let maximumBlueGreen = Color(hex: 0xff30C9AD)

}





extension Color {
    init(hex: UInt32) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
