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
                    
                    Column(colTitle: "To Do", cards: self.cardViewModel.cardsTODO,cardViewModel: self.cardViewModel)
                    Column(colTitle: "Doing", cards: self.cardViewModel.cardsDOING,cardViewModel: self.cardViewModel)
                    Column(colTitle: "Done", cards: self.cardViewModel.cardsDONE,cardViewModel: self.cardViewModel)
                    
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
                setOfCards()
            }
        }
            .frame(width:size.width, height: size.height)
    }
    
    func setOfCards () -> some View {
        return ScrollView {
            VStack {
                ForEach(self.cards) { card in
                    CardView(card: card)
//                        .onTapGesture {
//                            self.cardViewModel.showCard(card: card)
//                    }
                    .contextMenu {
                        VStack{
                            Button(action: {}) {
                                HStack {
                                    Text("Mover")
                                    Image(systemName: "star")
                                }
                            }
                            Button(action: {}) {
                                HStack {
                                    Text("Editar")
                                    Image(systemName: "star")
                                }
                            }
                            Button(action: {}) {
                                HStack {
                                    Text("Remover")
                                    Image(systemName: "trash")
                                }
                            }.foregroundColor(Color.red)
                        }
                    }
                }
            }
        }
    }
    
    //MARK: 🔢  Magical Numbers
    
    let columnCornerRadius : CGFloat = 10.00
    
}


