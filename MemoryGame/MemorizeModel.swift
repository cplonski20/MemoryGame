//
//  MemorizeGame.swift
//  StanfordApp
//
//  Created by Charles Plonski on 8/25/24.
//

import Foundation

struct MemorizeModel<CardContent>{
    private(set) var cards: Array<Card>
    
    init(numPairsOfCards : Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for idx in 0..<max(2,numPairsOfCards){
            let content = cardContentFactory(idx)
            cards.append(Card(content: content))
            cards.append(Card(content: content))

        }
    }
    func choose(_ card:Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card{
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
    }
    
}
