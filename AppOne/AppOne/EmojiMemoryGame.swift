//
//  EmojiMemoryGame.swift
//  AppOne
//
//  Created by Sri Gowda on 1/14/21.
//

import Foundation

class EmojiMemoryGame {
   // adding private makes the model only accessible to EmojiMemoryGame
   // you can add private(set) to make it viewable by others but only modifiable by EmojiMemoryGame
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame();
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojisArray: Array<String>  = ["🎃", "🕷", "👻"]
        return MemoryGame<String>(numberOfPairsOfCards: emojisArray.count) { pairIndex in
            return emojisArray[pairIndex]
        }

    }
    
    // MARK: - Access to Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
   // MARK: - Intent(s)
    func chooseCard(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
