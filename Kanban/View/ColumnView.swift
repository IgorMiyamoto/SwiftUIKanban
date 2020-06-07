//
//  ColumnView.swift
//  Kanban
//
//  Created by Igor Kenzo Miyamoto Dias on 07/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

// MARK: Collumn

struct Column : View{
    @State private var showingAddView = false
    
    var colTitle : String
    var cards : [CardModel.Card]
    var cardViewModel : CardViewModel
    
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
                if !cards.isEmpty {
                    setOfCards()
                }else{
                    ScrollView{
                        Spacer()
                    }
                }
            }
        }
            .frame(width:size.width, height: size.height)
    }
    
    func setOfCards () -> some View {
        return ScrollView {
            VStack {
                ForEach(self.cards) { card in
                    CardView(card: card)
                        .createContextMenu(card: card, action: self.cardViewModel.addOrUpdateCard, destructiveAction: self.cardViewModel.remove)
                    //.onTap(card: card)
                }
            }
        }
    }
    
    //MARK: 🔢  Magical Numbers
    
    let columnCornerRadius : CGFloat = 10.00
    
}
