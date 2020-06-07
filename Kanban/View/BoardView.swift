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
    
    @State private var showingAddViewBoard = false
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    var body: some View {
            VStack {
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
    
            .navigationBarTitle(cardViewModel.boardName)
            .navigationBarItems(trailing: Button(action:{
                    self.showingAddViewBoard.toggle()
                
            }) {
                    Image(systemName: "plus")
                }.sheet(isPresented: $showingAddViewBoard, content: {
                    AddView("Add", action: self.cardViewModel.addOrUpdateCard)
                    })
                )
            .onAppear{
                self.showingAddViewBoard = false
                self.cardViewModel.refresh()
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

