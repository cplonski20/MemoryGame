//
//  MemorizeGame.swift
//  StanfordApp
//
//  Created by Charles Plonski on 8/25/24.
//

import Foundation

struct MemorizeModel<CardContent> where CardContent : Equatable{
    private(set) var cards: Array<Card>
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? = nil
    
    init(numPairsOfCards : Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for idx in 0..<max(2,numPairsOfCards){
            let content = cardContentFactory(idx)
            cards.append(Card(content: content, id: "\(idx+1)a"))
            cards.append(Card(content: content, id: "\(idx+1)b"))

        }
    }
    
    mutating func choose(_ card: Card) {
            if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
                if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                    if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                        if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                            cards[chosenIndex].isMatched = true
                            cards[potentialMatchIndex].isMatched = true
                        }
                        indexOfTheOneAndOnlyFaceUpCard = nil

                    } else {
                        for index in cards.indices {
                            cards[index].isFaceUp = false
                        }
                        indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                    }
                    cards[chosenIndex].isFaceUp = true
                }
            }
        }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card : Equatable, Identifiable, CustomDebugStringConvertible{
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        
        var id : String
        
        var debugDescription: String{
            return "\(content) \(id)"
        }
    }
    
}
