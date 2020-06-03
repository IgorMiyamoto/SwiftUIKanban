//
//  CardModel.swift
//  Kanban
//
//  Created by Igor Kenzo Miyamoto Dias on 30/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation
import CoreData

//MARK: Status Enum

enum EnumStatus : Int{
    case TODO = 1
    case DOING
    case DONE
}

struct CardModel {
    var cards = [Card]()
    
    var coreDataStack = CoreDataStack()
    
    //MARK: Init
    
    init() {
        //addTestData()
        Fetch()
        //SaveData()
    }
    
    //MARK: Add Test Data
    
    func addTestData() {
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: coreDataStack.managedObjectContext) else {
            fatalError("Could not find entity description!")
        }
        
        let task = Task(entity: entity, insertInto: coreDataStack.managedObjectContext)
        task.title = "Aprender um pouco de SwiftUI"
        task.descrip = "Ver os vídeos de Stanford sobre o assunto parece ser um bom começo"
        task.status = Int16(EnumStatus.TODO.rawValue)
        
        let task2 = Task(entity: entity, insertInto: coreDataStack.managedObjectContext)
        task2.title = "Aprender um pouco de CoreData"
        task2.descrip = "Ver os vídeos do raywenderlich sobre o assunto parece ser um bom começo"
        task2.status = Int16(EnumStatus.TODO.rawValue)
        
        let task3 = Task(entity: entity, insertInto: coreDataStack.managedObjectContext)
        task3.title = "Aprender um pouco mais de Swift"
        task3.descrip = "Fazer um App de Kanban pode ser interessante"
        task3.status = Int16(EnumStatus.DOING.rawValue)
    }
    
    //MARK: Fetch
    
    mutating func Fetch () {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        
        do{
            if let results = try coreDataStack.managedObjectContext.fetch(fetchRequest) as? [Task] {
                
                cards = [Card]()
                
                for result in results {
                    let title = result.title
                    let descrip = result.descrip
                    let status = result.status
                    
                    //print("Tarefa: \(title) Descrição: \(descrip ?? "") Status: \(status)")
                    let c = Card(title: title, desc: descrip ?? "", status: EnumStatus(rawValue: Int(status))!, task: result)
                    cards.append(c)
                    
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
    
    func addCard(title: String, desc: String, img: String?, status: EnumStatus){
         
    }
    
    //MARK: Delete
    
    mutating func delete(card: Card){
        let deletingIndex = cards.firstIndexOf(of: card)!
        
        coreDataStack.managedObjectContext.delete(cards[deletingIndex].task)
        
        SaveData()
    }
    
    //MARK: Update
    
    func editCard(card: Card){
    }
    
    //MARK: Card Struct
    
    struct Card : Identifiable {
        var id = UUID()
        
        var title : String
        var desc : String
        //var img : String?
        // var isShowing: Bool = false
        var status : EnumStatus
        
        private(set) var task : Task
    }
}
