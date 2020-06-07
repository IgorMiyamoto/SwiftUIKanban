//
//  CardView.swift
//  Kanban
//
//  Created by Igor Kenzo Miyamoto Dias on 02/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

struct CardView: View{
    
    let card: CardModel.Card
    
    var body : some View {
        return ZStack(alignment: .leading) {
            GeometryReader { geometry in
                self.body(for: geometry.size)
            }
        }
            .frame(minHeight: cardMinSize, maxHeight: cardMaxSize)
            .padding()
    }
    
    func body (for size : CGSize) -> some View {
        return Group{
            RoundedRectangle(cornerRadius: cardCornerRadius)
                .stroke()
            VStack {
                Text(self.card.title)
                    .font(Font.system(.body))
                    .bold()
                Divider()
                Text(self.card.desc)
            }
                .padding()
                
        }
    }
    
    //MARK: 🔢 Magical numbers
    let cardMaxSize : CGFloat = 180.00
    let cardMinSize : CGFloat = 100.00
    let cardCornerRadius : CGFloat = 10.00
    let fontScale : CGFloat = 0.11
    
    func cardFontSize (for size : CGSize) -> CGFloat {
        min(size.width, size.height) * fontScale
    }
    
}

