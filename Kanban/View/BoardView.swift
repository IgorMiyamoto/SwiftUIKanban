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
                        AddView("Add", action: self.cardViewModel.addOrUpdateCard)
                        
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
                        .createContextMenu(card: card, action: self.cardViewModel.addOrUpdateCard, destructiveAction: self.cardViewModel.remove)
                    //.onTap(card: card)
                }
            }
        }
    }
    
    //MARK: 🔢  Magical Numbers
    
    let columnCornerRadius : CGFloat = 10.00
    
}


//
//struct BoardView_Previews: PreviewProvider {
//    static var previews: some View {
//        BoardView(cardViewModel: CardViewModel())
//    }
//}
