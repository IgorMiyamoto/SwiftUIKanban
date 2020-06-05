//
//  CoreDataStack.swift
//  Kanban
//
//  Created by Lucas Claro on 02/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack: NSObject {
    static let coreDataStack = CoreDataStack()
    
    private override init () {}
    
    static let moduleName = "Kanban"
    
    func saveMainContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch{
                fatalError("Error saving managed object context! \(error)")
            }
        }
    }
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: CoreDataStack.moduleName, withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    lazy var applicationDocumentsDirectory: NSURL = {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last! as NSURL
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        let persistentStoreURL = self.applicationDocumentsDirectory.appendingPathComponent("\(CoreDataStack.moduleName).sqlite")
        
        do{
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: persistentStoreURL, options: [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption: true])
        } catch {
            fatalError("Persistent store error! \(error)")
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
        return managedObjectContext
    }()
    
}
