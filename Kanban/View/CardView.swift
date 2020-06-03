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
//        var minHeight: CGFloat = cardMinSize
//        var maxHeight: CGFloat = cardMaxSize
//        print(card)
//        if card.isShowing {
//           minHeight *= 2
//          maxHeight *= 2
//        }
        
        return ZStack(alignment: .leading) {
            GeometryReader { geometry in
                self.body(for: geometry.size)
            }
        }
            .frame(minHeight: cardMinSize, maxHeight: cardMaxSize)
            .padding()
    }
    
    func body (for size : CGSize) -> some View {
        Group{
            RoundedRectangle(cornerRadius: cardCornerRadius)
                .stroke()
            VStack {
                Text(self.card.title)
                    .font(Font.system(size : cardFontSize(for: size)))
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


//@State private var offset = CGSize.zero
//
//// whether it is currently being dragged or not
//@State private var isDragging = false

//        let dragGesture = DragGesture()
//            .onChanged { value in self.offset = value.translation }
//            .onEnded { _ in
//                withAnimation {
//                    self.offset = .zero
//                    self.isDragging = false
//                }
//            }
//
//        // a long press gesture that enables isDragging
//        let pressGesture = LongPressGesture()
//            .onEnded { value in
//                withAnimation {
//                    self.isDragging = true
//                }
//            }
//
//        // a combined gesture that forces the user to long press then drag
//        let combined = pressGesture.sequenced(before: dragGesture)
        
//                .scaleEffect(self.isDragging ? 1.5 : 1)
//                    .offset(self.offset)
//                .gesture(combined)
