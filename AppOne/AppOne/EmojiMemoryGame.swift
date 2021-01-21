//
//  EmojiMemoryGame.swift
//  AppOne
//
//  Created by Sri Gowda on 1/14/21.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    private var theme: EmojiTheme

    // MARK: - Assingment 2 Solution
    var themeName: String { theme.name }
    var themeColor: Color { theme.color }
    var score: Int { model.score }
    
    init() {
        let theme = EmojiTheme() // Initialize theme
        self.theme = theme // set theme to new generated theme
        self.model = MemoryGame<String>(numberOfPairsOfCards: theme.emojis.count) { pairIndex in theme.emojis[pairIndex] } // set model to new game
    }
    
    // MARK: - Access to Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
   // MARK: - Intent(s)
    func chooseCard(card: MemoryGame<String>.Card){
        model.chooseCard(card: card)
    }
    
    func newGame() {
        theme = EmojiTheme()// declare a new instance of theme
        model = MemoryGame<String>(numberOfPairsOfCards: theme.emojis.count) { pairIndex in theme.emojis[pairIndex] } // declare a new model 
        
        print("Emoji Theme: \(theme)")
    }

}

/*  MARK: - Assingment 1 Solution
 static func createMemoryGame() -> MemoryGame<String> {
     let emojisArray: Array<String> = ["🎃", "🕷", "👻", "😈", "🧙"].shuffled()
     // creates access to model
     // returns random number between 2 and size of Emoji's Array
     return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...emojisArray.count))
     { pairIndex in
         return emojisArray[pairIndex]
     }
 }
 */

/* MARK: - Notes
 
 Class is easy to share, lives in the heap and has pointers to it -> all of our views can have pointers to it,
 but downfall is that model could be ruined by rogue view, need to protect it by making it "view only"
 and leave edit access to View Model

 "ObservableObject" protocol tells SwiftUI’s views to watch for changes
 
    class EmojiMemoryGame: ObservableObject { }
 
 Adding "private" makes the model only accessible to EmojiMemoryGame (View Model) -> none of the views can see the model
 Adding "private(set)" to make it viewable by others but only modifiable by EmojiMemoryGame
 Adding "@published" adds objectwillchange.send() function to changing vars
 this means that "announcements" are sent whenever something changes, telling views to update
 
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame(Theme: theme)
    static private var theme: EmojiTheme = EmojiMemoryGame.createTheme()

 Static allows you to use a function before you initalize instance
 static func makes it a function on the type
 
 static func createMemoryGame() -> MemoryGame<String> { }
 
 */
