//
//  BoardsModel.swift
//  Kanban
//
//  Created by Lucas Claro on 04/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation
import CoreData

struct BoardsModel {
    
    var boards = [Board]()
    
    var coreDataStack = CoreDataStack()
    
    init() {
        Fetch()
    }
    
    //MARK: Fetch
    
    mutating func Fetch () {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BoardData")
        
        do{
            if let results = try coreDataStack.managedObjectContext.fetch(fetchRequest) as? [BoardData] {
                
                boards = [Board]()
                
                for result in results {
                    let name = result.name
                    
                    let b = Board(name: name, boardData: result)
                    boards.append(b)
                    
                }
                
            }
        } catch {
            print("Fetch error!")
        }
    }
    
    //MARK: Save
    
    mutating func SaveData() {
        do{
            try coreDataStack.managedObjectContext.save()
        }
        catch {
            print("Error saving")
        }
        
        Fetch()
    }
    
    //MARK: Add
    
    mutating func add(name : String){
        guard let entity = NSEntityDescription.entity(forEntityName: "BoardData", in: coreDataStack.managedObjectContext) else {
            fatalError("Could not find entity description!")
        }
        
        let board = BoardData(entity: entity, insertInto: coreDataStack.managedObjectContext)
        board.name = name
            
        SaveData()
    }
    
    //MARK: Delete
    
    mutating func delete(board: Board){
        let deletingIndex = boards.firstIndexOf(of: board)!
        
        coreDataStack.managedObjectContext.delete(boards[deletingIndex].boardData)
        
        SaveData()
    }
    
    //MARK: Update
    
    mutating func update(board: Board){
        
        let changingIndex = boards.firstIndexOf(of: board)!
        boards[changingIndex].boardData.name = board.name
        print("entrei")
        
        SaveData()
    }
    
    //MARK: Visual Board Struct
    
    struct Board : Identifiable{
        var id = UUID()
        
        var name : String
        private(set) var boardData : BoardData
    }
    
}
