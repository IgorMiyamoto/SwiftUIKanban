//
//  Board+CoreDataProperties.swift
//  Kanban
//
//  Created by Lucas Claro on 04/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//
//

import Foundation
import CoreData


extension Board {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Board> {
        return NSFetchRequest<Board>(entityName: "Board")
    }

    @NSManaged public var name: String?
    @NSManaged public var contains: NSSet?

}

// MARK: Generated accessors for contains
extension Board {

    @objc(addContainsObject:)
    @NSManaged public func addToContains(_ value: Task)

    @objc(removeContainsObject:)
    @NSManaged public func removeFromContains(_ value: Task)

    @objc(addContains:)
    @NSManaged public func addToContains(_ values: NSSet)

    @objc(removeContains:)
    @NSManaged public func removeFromContains(_ values: NSSet)

}
