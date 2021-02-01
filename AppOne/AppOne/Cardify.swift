//
//  Cardify.swift
//  AppOne
//
//  Created by Sri Gowda on 1/24/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
     private let cRadius: CGFloat = 10.0
    private let lineWidth: CGFloat = 3
    
    func body(content: Content) -> some View {
        ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: cRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cRadius).stroke(lineWidth: lineWidth)
                content
            }
            else{
                RoundedRectangle(cornerRadius: cRadius).fill()
            }
        }
    }
}


extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
