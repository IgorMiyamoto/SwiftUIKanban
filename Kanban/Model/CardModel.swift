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
            Card(id: 0, title: "1 card", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas posuere imperdiet augue, non convallis nisi fermentum nec. Suspendisse sollicitudin tristique ultrices. Nulla eget nibh quis augue placerat convallis. Suspendisse orci eros, gravida quis augue quis, ornare varius tortor. In tincidunt porttitor lacus, in semper magna fermentum a. Nunc egestas accumsan turpis eu tincidunt. Aenean eu diam a nibh dictum dignissim a ut lacus. Aenean vestibulum auctor odio sollicitudin tristique. Aliquam laoreet risus est, id gravida tellus vulputate eu. Praesent varius justo consectetur est efficitur, eu condimentum ipsum egestas. Phasellus ornare elementum arcu, eget mollis augue imperdiet vel. Duis placerat laoreet purus, nec pharetra purus sodales id. Aenean ut malesuada ante. Duis luctus, erat non molestie auctor, diam quam maximus odio, egestas dapibus quam quam et justo. Vivamus aliquam non tellus nec aliquam. Sed in sem et eros dapibus tincidunt.", status: EnumStatus.TODO),
            Card(id: 1, title: "2 card", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas posuere imperdiet augue, non convallis nisi fermentum nec. Suspendisse sollicitudin tristique ultrices. Nulla eget nibh quis augue placerat convallis. Suspendisse orci eros, gravida quis augue quis, ornare varius tortor. In tincidunt porttitor lacus, in semper magna fermentum a. ", status: EnumStatus.DOING),
            Card(id: 2, title: "3 card", desc: "Implementar add, editar, remover", status: EnumStatus.DONE),
            Card(id: 3, title: "4 card", desc: "Numeros 21234567890987654345678909876543456789", status: EnumStatus.TODO),
            Card(id: 4, title: "5 card", desc: "emojis 📲💾", status: EnumStatus.DOING),
            Card(id: 5, title: "6 card", desc: "", status: EnumStatus.DONE),
        ]
    }
    
    //MARK: FUCTIONS TO ADD LATER
    /*
    func addCard(title: String, desc: String, img: String?, status: EnumStatus){}
    func removeCard(card: Card){}
    func editCard(card: Card, title: String, desc: String, img: String?, status: EnumStatus){}
    */
//    mutating func show(card: CardModel.Card)
//    {
//        let index = firstIndexOf(card: card)!
//        cards[index].isShowing = !cards[index].isShowing
//    }
//
//    func firstIndexOf(card: CardModel.Card) -> Int? {
//        for index in 0..<cards.count {
//            if cards[index].id == card.id{
//                return index
//            }
//        }
//        return nil
//    }
    
    struct Card : Identifiable {
        var id : Int
        var title : String
        var desc : String
        var img : String?
       // var isShowing: Bool = false
        var status : EnumStatus
    }
}
