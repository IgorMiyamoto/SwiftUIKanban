//
//  ContentView.swift
//  Kanban
//
//  Created by Igor Kenzo Miyamoto Dias on 30/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

// MARK: Board

struct BoardView: View {
    @ObservedObject var cardViewModel : CardViewModel
    
    var body: some View {
        
        ScrollView (.horizontal) {
            GeometryReader { geometry in
                HStack(spacing: self.horizontalSpacing){
                    
                    Column(colTitle: "To Do", cards: self.cardViewModel.cardsTODO)
                    Column(colTitle: "Doing", cards: self.cardViewModel.cardsDOING)
                    Column(colTitle: "Done", cards: self.cardViewModel.cardsDONE)
                    
                }
            }
                .frame(width: boardWidth)
                .padding()
        }
        
    }
    
    //MARK: 🔢 Magical Numbers
    let horizontalSpacing : CGFloat = 5.00
    let boardWidth : CGFloat = 1000.00
}

// MARK: Collumn

struct Column : View{
    var colTitle : String
    var cards : [CardModel.Card]
    
    var body : some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body (for size : CGSize) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: columnCornerRadius).stroke()
            VStack {
                Text(self.colTitle).padding()
                Divider()
                setOfCards()
            }
        }
            .frame(width:size.width, height: size.height)
    }
    
    func setOfCards () -> some View {
        ScrollView {
            VStack {
                ForEach(self.cards) { card in
                    CardView(card: card)
                }
            }
        }
    }
    
    //MARK: 🔢  Magical Numbers
    
    let columnCornerRadius : CGFloat = 10.00
    
}

// MARK: Card

struct CardView: View{
    let card: CardModel.Card
    
    var body : some View {
        ZStack(alignment: .leading) {
            GeometryReader { geometry in
                self.body(for: geometry.size)
            }
        }
            .frame(minHeight: cardMaxSize, maxHeight: cardMinSize)
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
    let cardMinSize : CGFloat = 180.00
    let cardMaxSize : CGFloat = 100.00
    let cardCornerRadius : CGFloat = 10.00
    let fontScale : CGFloat = 0.11
    
    func cardFontSize (for size : CGSize) -> CGFloat {
        min(size.width, size.height) * fontScale
    }
    
}


