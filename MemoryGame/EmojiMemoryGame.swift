//
//  EmojiMemoryGame.swift
//  StanfordApp
//
//  Created by Charles Plonski on 8/25/24.
//

import SwiftUI

//Big idea is this will interact with the model through fucntions only holding a single refrence to the model's struct and that way it will write in place

class EmojiMemoryGame: ObservableObject {
    private static let emojis : [String] = ["😀", "❤️", "🎉", "🔥", "👍", "😂", "🌟", "💡", "😎", "🌍", "🥳", "💪", "🧠", "🎨", "🍕", "🎧", "🚀", "🏆", "🌈", "🕶"]
    
    static func createMemoryModel() -> MemorizeModel<String> {
        return MemorizeModel(numPairsOfCards : 4) {pairIndex in
            
            if pairIndex >= 0 && pairIndex < emojis.count{
                return emojis[pairIndex]
            }
            else{
                return "App is Fucked"
            }
        }
    }
    
    //if something changes in  a published var, an observableobject (like our viewmodel) will say something changed.
    @Published private var model = createMemoryModel()
    
    var cards: Array<MemorizeModel<String>.Card>{ //Computed readable allowing access to cards
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    func choose(_ card : MemorizeModel<String>.Card){
        model.choose(card)
    }
    

}
