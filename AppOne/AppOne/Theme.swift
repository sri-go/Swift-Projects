//
//  Theme.swift
//  AppOne
//
//  Created by Sri Gowda on 1/19/21.
//

import Foundation
import SwiftUI

// Emoji Model
struct EmojiTheme {
    var name: String
    var emojis: [String]
    var color: Color
    
    
    init() {
        // Creates an Array of type tuple with the definitions of each requirement explicitly defined
        // Number of cards is Optional
        let themes: [(name:String, emojis:[String], number: Int?, color: Color)] =
            [("Halloween", ["👻", "🎃", "🕷", "🕸", "🦇", "🍭", "😱", "👽", "🧟", "🦹", "🧙‍♀️", "🧛‍♂️"], nil, .orange ),
             ("Animals", ["🦊", "🐯", "🐸", "🐷", "🐻"], 3, .green),
             ("Sports", ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉"], nil, .red),
             ("Weather", ["☀️", "❄️", "💨", "🌈", "☔️", "🌩"], 5, .purple),
             ("Space", ["🪐", "✨", "☄️", "🚀", "👩‍🚀"], 4, .yellow),
             ("Flags", ["🇿🇦", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇸🇪", "🇰🇷", "🇹🇷", "🇻🇪"], 6, .blue)]
        
        // Accessing theme
        let chosenTheme = themes.randomElement()!
        let number = chosenTheme.number ?? Int.random(in: 2...chosenTheme.emojis.count)
        

        // Using self here to refer to the Theme Struct and not the local variable inside init
        self.name = chosenTheme.name
        self.color = chosenTheme.color
        self.emojis = Array(chosenTheme.emojis.shuffled().prefix(number))
    }
}
