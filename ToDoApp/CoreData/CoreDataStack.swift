//
//  CoreDataStack.swift
//  ToDoApp
//
//  Created by anastasija.zukova on 21/05/2020.
//  Copyright © 2020 Accenture. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    var container: NSPersistentContainer {
        let container = NSPersistentContainer(name: "ToDoData")
        container.loadPersistentStores { (description, error) in guard error == nil else { print("Error: \(String(describing: error))")
            return
            }
        }
        return container
    }
    
    var managedContext: NSManagedObjectContext {
        return container.viewContext 
    }
}

    

    
