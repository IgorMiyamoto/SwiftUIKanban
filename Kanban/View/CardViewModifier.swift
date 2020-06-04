//
//  CardViewModifier.swift
//  Kanban
//
//  Created by Igor Kenzo Miyamoto Dias on 03/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

struct ContextMenu : ViewModifier {
    @State private var showingAddView = false
    
    var card: CardModel.Card
    var action : (CardModel.Card)->Void
    var destructiveAction : (CardModel.Card)->Void
    
    func body(content: Content) -> some View {
        content.contextMenu{ 
                 VStack{
                     Button(action: {}) {
                         HStack {
                             Text("Open")
                             Image(systemName: "arrow.up.left.and.arrow.down.right")
                         }
                     }
                     Button(action: {}) {
                         HStack {
                             Text("Move")
                             Image(systemName: "arrow.right.arrow.left")
                         }
                     }
                     Button(action: {self.showingAddView.toggle()}) {
                         HStack {
                             Text("Edit")
                             Image(systemName: "pencil")
                         }
                     }.sheet(isPresented: self.$showingAddView, content: {
                        AddView("Edit",card: self.card, action: self.action)
                     })
                    Button(action: {self.destructiveAction(self.card)}) {
                         HStack {
                             Text("Remove")
                             Image(systemName: "trash")
                         }
                     }.foregroundColor(Color.red)
                 }
             }
    }
}

extension View {
    func createContextMenu(card : CardModel.Card, action : @escaping (CardModel.Card)->Void, destructiveAction: @escaping (CardModel.Card)->Void) -> some View {
        return self.modifier(ContextMenu(card: card, action: action, destructiveAction: destructiveAction))
    }
}

