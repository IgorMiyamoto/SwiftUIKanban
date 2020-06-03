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
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    Text("Sem a Testa")
                    Spacer()
                    Button(action:{ self.showingAddView.toggle()}) {
                        Image(systemName: "plus")
                        
                    }.sheet(isPresented: $showingAddView, content: {
                        AddView("Add")
                        
                    })
                }.padding()
                
                ScrollView(.horizontal) {
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
        .navigationBarTitle("")
        .navigationBarHidden(true)
        }
       
    }
    
    //MARK: 🔢 Magical Numbers
    let horizontalSpacing : CGFloat = 5.00
    let boardWidth : CGFloat = 1000.00
}

//extension UINavigationController {
//    override open func viewDidLoad() {
//        super.viewDidLoad()
//        navigationBar.isHidden = true
//    }
//}

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
                                AddView("Edit",card: card)
                            })
                            Button(action: {self.cardViewModel.remove(card: card)}) {
                                HStack {
                                    Text("Remove")
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


