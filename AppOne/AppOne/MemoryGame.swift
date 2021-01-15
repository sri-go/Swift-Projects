//
//  MemoryGame.swift
//  AppOne
//
//  Created by Sri Gowda on 1/14/21.
//

import Foundation


//Model could be a SQL Database, or HTTP Request

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>(); //initalize cards as an empty array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex);
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
    }
    
    func choose(card: Card){
        print("You have chosen \(card)")
    }
    
    // full name of this data structure is MemoryGame.Card
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}
