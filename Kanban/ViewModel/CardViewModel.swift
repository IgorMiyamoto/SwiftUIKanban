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
    
    
    //MARK: Get model stuff
    
    var cards : Array<CardModel.Card>{
        cardModel.cards
    }
    
    var cardsTODO : Array<CardModel.Card>{
        cardModel.cards.filter { $0.status == EnumStatus.TODO }
    }
    
    var cardsDOING : Array<CardModel.Card>{
        cardModel.cards.filter { $0.status == EnumStatus.DOING }
    }
    
    var cardsDONE : Array<CardModel.Card>{
        cardModel.cards.filter { $0.status == EnumStatus.DONE }
    }
    //MARK: Intents
    
//    func showCard(card: CardModel.Card)
//    {
//        cardModel.show(card: card)
//    }
}
