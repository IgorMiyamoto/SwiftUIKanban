//
//  BoardsViewModel.swift
//  Kanban
//
//  Created by Lucas Claro on 04/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation

class BoardsViewModel : ObservableObject {
    @Published private var boardsModel : BoardsModel = BoardsModel()
    
    
    //MARK: Get model stuff
    
    var boards : Array<BoardsModel.Board> {
        return boardsModel.boards
    }
    
    //MARK: Intents
    
    func addBoard (name : String){
        boardsModel.add(name: name)
    }
    
    func deleteBoard (board : BoardsModel.Board){
        boardsModel.delete(board: board)
    }
    
    func update(board : BoardsModel.Board){
        boardsModel.update(board: board)
    }
}
