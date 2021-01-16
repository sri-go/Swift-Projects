//
//  ContentView.swift
//  AppOne
//
//  Created by Sri Gowda on 1/14/21.
//

import SwiftUI
 
struct ContentView: View {
    // @observedobject, tells swift to redraw when model changes
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        if(viewModel.cards.count < 5){
            HStack{
                ForEach(viewModel.cards){ card in
                    CardView(card: card).onTapGesture { viewModel.chooseCard(card: card) }
                    }
                }
                .padding()
                .foregroundColor(Color.orange)
                .font(Font.largeTitle)
                .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
        }
        else{
            HStack{
                ForEach(viewModel.cards){ card in
                    CardView(card: card).onTapGesture { viewModel.chooseCard(card: card) }
                    }
                }
                .padding()
                .foregroundColor(Color.orange)
                .font(Font.title)
                .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
            Spacer()
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    // MARK: - Drawing Constants

    let cRadius: CGFloat = 10.0
    let lineWidth: CGFloat = 3
    let scalingFactor: CGFloat = 0.75
    
    var body: some View {
        GeometryReader{ geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: cRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cRadius).stroke(lineWidth: lineWidth)
                Text(card.content)
            }
            else{
                RoundedRectangle(cornerRadius: cRadius).fill()
            }
        }.font(Font.system(size: fontSize(for: size)))
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * scalingFactor
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(viewModel: EmojiMemoryGame())
        }
    }
}
