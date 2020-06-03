//
//  Array+FirstIndexOf.swift
//  Kanban
//
//  Created by Lucas Claro on 03/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation

extension Array where Element : Identifiable{
    func firstIndexOf (of item: Element) -> Int?{
        for index in 0..<self.count {
            if self[index].id == item.id {
                return index
            }
        }
        
        return nil
    }
}
