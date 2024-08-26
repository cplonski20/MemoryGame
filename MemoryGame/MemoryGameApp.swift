//
//  VoicePadApp.swift
//  VoicePad
//
//  Created by Charles Plonski on 8/25/24.
//

import SwiftUI

@main
struct MemoryGame: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
