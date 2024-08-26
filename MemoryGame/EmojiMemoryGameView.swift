import SwiftUI
import AVFoundation

struct EmojiMemoryGameView: View {

    
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Button("Shuffle"){
                viewModel.shuffle() //intent
            }
            
        }
        
    }

    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self){ index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.padding().foregroundColor(.orange)
        
    }
}

struct CardView: View {
    let card: MemorizeModel<String>.Card //How is it okay to mention the model?? Mayne okay since we are just getting the type from model?
    
    init(_ card: MemorizeModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack(){
            let base : some View = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 10)
                Text(card.content).font(.system(size: 50))
            }.opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
