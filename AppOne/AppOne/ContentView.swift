//
//  ContentView.swift
//  AppOne
//
//  Created by Sri Gowda on 1/14/21.
//

import SwiftUI
 
struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
            GameControls(score: viewModel.score, title: viewModel.themeName, color: viewModel.themeColor, buttonAction: viewModel.newGame)
            
            Grid(viewModel.cards) {  card in
                CardView(card: card).onTapGesture {
                    viewModel.chooseCard(card: card)
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(Color.orange)
        }
    }
} 

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    // MARK: - Drawing Constants
    private let scalingFactor: CGFloat = 0.65
    
    var body: some View {
        GeometryReader{ geometry in
            body(for: geometry.size) 
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View{
        if card.isFaceUp || !card.isMatched {
            ZStack{
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    . padding(5).opacity(0.4)
                
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }.cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * scalingFactor
    }
}

struct GameControls: View {
    var score: Int
    var title: String
    var color: Color
    let buttonAction: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 30) {
            Text("Score: \(score)")
            Text(title).font(.headline).foregroundColor(color)
            Button("New Game") {
                buttonAction()
            }
        }
        .font(.headline)
    }
}
// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.chooseCard(card: game.cards[0])
        return ContentView(viewModel: game)
    }
}

/* MARK: - Notes

 "@observedobject", tells swift to redraw when model changes
        @ObservedObject var viewModel: EmojiMemoryGame
 
 */
