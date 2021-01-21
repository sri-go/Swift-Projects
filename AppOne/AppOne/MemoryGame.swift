//
//  MemoryGame.swift
//  AppOne
//
//  Created by Sri Gowda on 1/14/21.
//

import Foundation


//Model could be a SQL Database, or HTTP Request
struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    var score: Int
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        } 
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>(); //initalize cards as an empty array
        score = 0 // initalize score to 0 
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    mutating func chooseCard(card: Card){
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }
                else{
                    cards[chosenIndex].isAlreadySeen = true
                    cards[potentialMatchIndex].isAlreadySeen = true
                    if cards[chosenIndex].isAlreadySeen == true { score -= 1}
                    if cards[potentialMatchIndex].isAlreadySeen == true { score -= 1}
                }
                cards[chosenIndex].isFaceUp = true
            }
            else{
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
        print("You have chosen \(card)")

    }
    // Full name of this data structure is MemoryGame.Card
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isAlreadySeen: Bool = false
        var content: CardContent
        var id: Int
    }

}

/* MARK: - Notes
 
    "Computed Properties"
        var indexOfOneandOnlyOneFaceUpCard: Int? {
            get { }
            set { }
            // set has a property newValue that allows you to check
        }
 
    "?" after Type reference means optional
        var indexOfOneandOnlyOneFaceUpCard: Int?
    
    Add mutating to values that change
        mutating func chooseCard(card: Card){ }
 
    "," is a sequential operator in "if let" statement, allows you to bind other requirements to the if statement
        equivalent to if x == 5 && y == 5
    
 "if let" allows you to safely access optional value
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfOneandOnlyOneFaceUpCard { }
        }
 
 */
