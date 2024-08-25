import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isRecording = false
    @State private var audioRecorder: AVAudioRecorder?
    //@state allows the proeprty to be changed and it prompts the view to rerender whenever it changes

    var body: some View {
        HStack {
            CardView(isFaceUp: false)
            CardView()
            CardView()
            CardView()
            
        }
        .padding().foregroundColor(.orange).imageScale(.large)
    }
}

struct CardView: View {
    var isFaceUp: Bool = true
    
    var body: some View {
        ZStack(){
            if(isFaceUp){
                //Creates a rounded rectangle that is white. We need this as we can't rely on background being white since back drop can change to dark in night mode
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                //Creates a rounded rectange that just has a strokeborder and it defautls to the foreground color
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 10)
                Text("⚡️").font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 12)

            }
        }
    }
}
#Preview {
    ContentView()
}
