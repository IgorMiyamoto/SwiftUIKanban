//
//  CarViewModifierOnTap.swift
//  Kanban
//
//  Created by Igor Kenzo Miyamoto Dias on 04/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

struct CardViewModifierOnTap : ViewModifier {
    var card : CardModel.Card
    @State private var showing = false
    func body(content: Content) -> some View {
        content.onTapGesture {
            self.showing.toggle()
        }.sheet(isPresented: self.$showing, content: {ShowDataCardView(card: self.card)})
    }
}

extension View {
    func onTap(card: CardModel.Card) -> some View {
        return self.modifier(CardViewModifierOnTap(card: card))
    }
}


