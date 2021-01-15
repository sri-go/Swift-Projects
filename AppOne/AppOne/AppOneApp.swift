//
//  AppOneApp.swift
//  AppOne
//
//  Created by Sri Gowda on 1/14/21.
//

import SwiftUI

@main
struct AppOneApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: EmojiMemoryGame())
        }
    }
}
