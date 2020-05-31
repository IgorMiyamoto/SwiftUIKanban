//
//  CardModel.swift
//  Kanban
//
//  Created by Igor Kenzo Miyamoto Dias on 30/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation

enum EnumStatus {
    case TODO
    case DOING
    case DONE
}

struct CardModel {
    var cards = [Card]()
    
    init() {
        cards = [
            Card(id: 0, title: "1 card", desc: "VRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUMVRUM", status: EnumStatus.TODO),
            Card(id: 1, title: "2 card", desc: "praá praá", status: EnumStatus.DOING),
            Card(id: 2, title: "3 card", desc: "glub glub", status: EnumStatus.DONE),
            Card(id: 3, title: "4 card", desc: "tuta", status: EnumStatus.TODO),
            Card(id: 4, title: "5 card", desc: "juju", status: EnumStatus.DOING),
            Card(id: 5, title: "6 card", desc: "Saci", status: EnumStatus.DONE),
        ]
    }
    
    //MARK: FUCTIONS TO ADD LATER
    /*
    func addCard(title: String, desc: String, img: String?, status: EnumStatus){}
    func removeCard(card: Card){}
    func editCard(card: Card, title: String, desc: String, img: String?, status: EnumStatus){}
    */
    struct Card : Identifiable {
        var id : Int
        var title : String
        var desc : String
        var img : String?
        var status : EnumStatus
    }
}