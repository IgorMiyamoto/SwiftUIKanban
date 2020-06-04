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
    @State private var showingCard = false
    @State private var showingMoveOptions = false
    @State private var status = 0
    
    var card: CardModel.Card
    var action : (CardModel.Card)->Void
    var destructiveAction : (CardModel.Card)->Void
    
    var moveButtons = [ActionSheet.Button]()
    
    func body(content: Content) -> some View {
        content.contextMenu { 
                 VStack{
                     Button(action: {self.showingCard.toggle()}) {
                         HStack {
                             Text("Open")
                             Image(systemName: "arrow.up.left.and.arrow.down.right")
                         }
                        }.sheet(isPresented: self.$showingCard, content: {
                        ShowDataCardView(card: self.card)
                     })
                    
                    Button(action: {withAnimation{self.showingMoveOptions.toggle()}}) {
                         HStack {
                             Text("Move")
                             Image(systemName: "arrow.right.arrow.left")
                         }
                    }.actionSheet(isPresented: self.$showingMoveOptions, content:{
                        ActionSheet(title: Text("Where to?"),message: nil ,buttons: [ActionSheet.Button.default(Text("To Do"), action:{self.attCard(card: self.card,status: EnumStatus.TODO.rawValue)}),
                        ActionSheet.Button.default(Text("Doing"), action: {self.attCard(card: self.card,status: EnumStatus.DOING.rawValue)}),
                        ActionSheet.Button.default(Text("Done"), action: {self.attCard(card: self.card,status: EnumStatus.DONE.rawValue)})])
                    })
                    
                    
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
    func attCard(card: CardModel.Card ,status: Int)
    {
        var c = card
        c.status  = EnumStatus(rawValue: status)!
        self.action(c)
    }
}

extension View {
    func createContextMenu(card : CardModel.Card, action : @escaping (CardModel.Card)->Void, destructiveAction: @escaping (CardModel.Card)->Void) -> some View {
        return self.modifier(ContextMenu(card: card, action: action, destructiveAction: destructiveAction))
    }
}

