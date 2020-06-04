//
//  Task+CoreDataProperties.swift
//  Kanban
//
//  Created by Lucas Claro on 04/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var descrip: String?
    @NSManaged public var status: Int16
    @NSManaged public var title: String
    @NSManaged public var isInside: BoardData

}
