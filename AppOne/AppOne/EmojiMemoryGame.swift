//
//  EmojiMemoryGame.swift
//  AppOne
//
//  Created by Sri Gowda on 1/14/21.
//

import Foundation

// ObservableObject only works for class
class EmojiMemoryGame: ObservableObject {
   // adding private makes the model only accessible to EmojiMemoryGame
   // you can add private(set) to make it viewable by others but only modifiable by EmojiMemoryGame
    // adding @published adds objectwillchange.send() to changing vars 
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame();
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojisArray: Array<String>  = ["🎃", "🕷", "👻", "😈", "🧙"].shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...emojisArray.count)) //returns random number between 2 and size of Emoji's Array
        { pairIndex in
            return emojisArray[pairIndex]
        }
    }
    
    // MARK: - Access to Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
   // MARK: - Intent(s)
    func chooseCard(card: MemoryGame<String>.Card){
        model.chooseCard(card: card)
    }
}
