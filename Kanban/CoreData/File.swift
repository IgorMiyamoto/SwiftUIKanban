//
//  File.swift
//  Kanban
//
//  Created by Lucas Claro on 02/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation
import CoreData

public class Task : NSManagedObject, Identifiable{
    
    @NSManaged public var title: String?
    @NSManaged public var descp : String?
    @NSManaged public var status : String?
}

extension Task {
    static func getAllTasks() -> NSFetchRequest<Task> {
        let request: NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
        
        return request
    }
}
