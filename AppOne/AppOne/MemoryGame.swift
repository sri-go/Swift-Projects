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
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
    }
    
    // need to add mutating to values that change
    mutating func chooseCard(card: Card){
        print("You have chosen \(card)")
        let chosenIndex: Int = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id{
                return index
            }
        }
        // if index not found:
        return -1 //TODO: fix value not found
    }
    
    // full name of this data structure is MemoryGame.Card
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}
