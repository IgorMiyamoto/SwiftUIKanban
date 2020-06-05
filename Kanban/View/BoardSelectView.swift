//
//  BoardSelectView.swift
//  Kanban
//
//  Created by Lucas Claro on 04/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

struct BoardSelectView: View {
    
    @ObservedObject var boardsViewModel : BoardsViewModel
    
    @State private var newBoard = ""
    @State private var updateBoard : BoardsModel.Board?
    @State private var updateName = ""
    
    var body: some View {

        NavigationView{
            List {
                
                if updateBoard == nil{
                    addRow()
                }
                else{
                    editRow()
                }
                
                Section(header: Text("My Boards")){
                    ForEach (boardsViewModel.boards) { board in
                        NavigationLink(destination: BoardView.init(cardViewModel: CardViewModel(board: board)), label: {self.cell(for: board)})
                    }
                        .onDelete { index in
                            let deleteBoard = self.boardsViewModel.boards[index.first!]
                            self.boardsViewModel.deleteBoard(board: deleteBoard)
                            self.newBoard = ""
                        }

                }
            }
                .navigationBarTitle("Boards")
        }
    }
    
    func cell(for board: BoardsModel.Board) -> some View {
        
        
        Text(board.name)
            .onLongPressGesture{
                  self.updateBoard = board
                  self.updateName = board.name
            }
        
    }
    
    func addRow() -> some View {
        Section(header: Text("New Board")){
            HStack{
                TextField("Board Name", text: $newBoard)
                Button(action: {
                    if !self.newBoard.isEmpty {
                        self.boardsViewModel.addBoard(name: self.newBoard)
                        self.newBoard = ""
                    }
                }){
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.green)
                        .imageScale(.large)
                }
            }
        }
    }
    
    func editRow() -> some View {
        Section(header: Text("Edit Board")){
            HStack{
                
                Image(systemName: "xmark.circle.fill")
                .foregroundColor(.red)
                .imageScale(.large)
                    .onTapGesture {
                        self.updateBoard = nil
                }
                
                
                TextField(updateBoard!.name, text: $updateName)
            
                Image(systemName: "pencil.circle.fill")
                .foregroundColor(.green)
                .imageScale(.large)
                    .onTapGesture {
                        if !self.updateName.isEmpty {
                            self.updateBoard?.name = self.updateName
                            self.boardsViewModel.update(board: self.updateBoard!)
                            self.updateBoard = nil
                        }
                }
            }
        }
    }
    
}
