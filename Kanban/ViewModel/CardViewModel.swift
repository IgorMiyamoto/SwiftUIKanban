//
//  CardViewModel.swift
//  Kanban
//
//  Created by Igor Kenzo Miyamoto Dias on 30/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation

class CardViewModel : ObservableObject {
    @Published private var cardModel : CardModel = CardModel()
    
    private var board : BoardsModel.Board
    
    init(board : BoardsModel.Board) {
        self.board = board
    }
    
    
    //MARK: Get model stuff
    
    var cards : Array<CardModel.Card>{
        cardModel.cards
    }
    
    var cardsTODO : Array<CardModel.Card>{
        return cardModel.cards.filter { $0.status == EnumStatus.TODO }
    }
    
    var cardsDOING : Array<CardModel.Card>{
        cardModel.cards.filter { $0.status == EnumStatus.DOING }
    }
    
    var cardsDONE : Array<CardModel.Card>{
        cardModel.cards.filter { $0.status == EnumStatus.DONE }
    }
    
    var boardName : String{
        board.name
    }
    
    //MARK: Intents
    
    func remove(card : CardModel.Card){
        cardModel.delete(card : card)
    }
    
    func addOrUpdateCard(card : CardModel.Card) {
        if card.task == nil{
            cardModel.add(card: card, board: board)
        }
        else {
            cardModel.update(card: card)
        }
    }
    
    func refresh(){
        cardModel.Fetch()
    }
    
//    func showCard(card: CardModel.Card)
//    {
//        cardModel.show(card: card)
//    }

}
