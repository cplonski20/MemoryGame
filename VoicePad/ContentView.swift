import SwiftUI
import AVFoundation

struct ContentView: View {
//    @State private var isRecording = false
//    @State private var audioRecorder: AVAudioRecorder?
    //@state allows the proeprty to be changed and it prompts the view to rerender whenever it changes
    @State var cardCount: Int = 4
    let emojis : [String] = ["⚡️", "Ó","⚡️", "Ó","⚡️", "Ó","⚡️", "Ó","⚡️", "Ó"]
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjuster
            
        }
        
    }
    var cardCountAdjuster : some View {
            HStack{
            Button(action: {
                cardCount = max(cardCount - 1,1)
            }, label: {
                Image(systemName: "folder.badge.minus")
            })
            Spacer()
            Button(action: {
                cardCount = min(cardCount + 1 , emojis.count)
            }, label: {
                Text("Add Card")
            })
        }.padding().font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 123))]) {
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index]).aspectRatio(2/3, contentMode: .fit)
            }
        }.padding().foregroundColor(.orange)
        
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content : String = "⚡️"
    var body: some View {
        ZStack(){
            let base : some View = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 10)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
