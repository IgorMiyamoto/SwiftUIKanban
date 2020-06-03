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
        addTestData()
        Fetch()
        
        
    }
    
    //MARK: Test Data Functions
    
    func addTestData() {
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: coreDataStack.managedObjectContext) else {
            fatalError("Could not find entity description!")
        }
        
        let task = Task(entity: entity, insertInto: coreDataStack.managedObjectContext)
        task.setValue("Aprender um pouco de SwiftUI", forKey:"title")
        task.setValue("Ver os vídeos de Stanford sobre o assunto parece ser um bom começo", forKey: "descrip")
        task.setValue(EnumStatus.TODO.rawValue, forKey: "status")
        
        let task2 = Task(entity: entity, insertInto: coreDataStack.managedObjectContext)
        task2.setValue("Aprender um pouco de CoreData", forKey:"title")
        task2.setValue("Ver os vídeos do raywenderlich sobre o assunto parece ser um bom começo", forKey: "descrip")
        task2.setValue(EnumStatus.TODO.rawValue, forKey: "status")
        
        let task3 = Task(entity: entity, insertInto: coreDataStack.managedObjectContext)
        task3.setValue("Aprender um pouco mais de Swift", forKey:"title")
        task3.setValue("Fazer um App de Kanban pode ser interessante", forKey: "descrip")
        task3.setValue(EnumStatus.DOING.rawValue, forKey: "status")
    }
    
    mutating func Fetch () {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        
        do{
            if let results = try coreDataStack.managedObjectContext.fetch(fetchRequest) as? [Task] {
                
                for result in results {
                    let title = result.title
                    let descrip = result.descrip
                    let status = result.status
                    
                    //print("Tarefa: \(title) Descrição: \(descrip ?? "") Status: \(status)")
                    let c = Card(title: title, desc: descrip ?? "", status: EnumStatus(rawValue: Int(status))!)
                    cards.append(c)
                    
                }
                
            }
        } catch {
            print("Fetch error!")
        }
    }
    
    func addCard(title: String, desc: String, img: String?, status: EnumStatus){
         
    }
    
    //func removeCard(card: Card){}
    //func editCard(card: Card, title: String, desc: String, img: String?, status: EnumStatus){}
    
    
    
    struct Card : Identifiable {
        var id = UUID()
        var title : String
        var desc : String
        //var img : String?
        var status : EnumStatus
    }
}
