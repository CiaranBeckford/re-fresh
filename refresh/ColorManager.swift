//
//  ColorManager.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/16/20.
//

import SwiftUI

struct ColorManager {
    // static let spotifyGreen = Color("SpotifyGreen")
}

// Or you can use an extension
// this will allow you to just type .spotifyGreen and you wont have to use ColorManager.spotifyGreen
extension Color {
    
    init(_ hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    // static let spotifyGreen = Color("SpotifyGreen")
    static let boneWhite = Color("BoneWhite")
    static let teal = Color("Teal")
    // ... add the rest of your colors here
    
    
}
