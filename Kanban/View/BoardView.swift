//
//  ContentView.swift
//  Kanban
//
//  Created by Igor Kenzo Miyamoto Dias on 30/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var cardViewModel : CardViewModel
    var body: some View {
        ScrollView (.horizontal){
            GeometryReader { geometry in
                HStack(spacing: 5){
                    Column(colTitle: "To Do", cards: self.cardViewModel.cardsTODO)
                    Column(colTitle: "Doing", cards: self.cardViewModel.cardsDOING)
                    Column(colTitle: "Done", cards: self.cardViewModel.cardsDONE)
                }
            }.frame(width:1000)
        }
    }
}

struct Column : View{
    var colTitle : String
    var cards : [CardModel.Card]
    
    var body : some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 10).stroke()
                VStack {
                    Text(self.colTitle).padding()
                    Divider()
                    ScrollView {
                        VStack {
                            ForEach(self.cards) { card in
                                CardView(card: card)
                            }
                        }
                    }
                }
            }.frame(width:geometry.size.width, height: geometry.size.height)
        }
    }
}



struct CardView: View{
    let card: CardModel.Card
    
    var body : some View {
        return ZStack(alignment: .leading){
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 10).stroke()
                VStack {
                    Text(self.card.title).font(Font.system(size: min(geometry.size.height,geometry.size.width)/9)).bold()
                    Divider()
                    Text(self.card.desc)
                }.padding()
            }
        }
        .frame(minHeight:100,maxHeight: 180)
        .padding()
    }
}


