//
//  CoreDataHandler.swift
//  CoreData-NonPrimitive
//
//  Created by MOBILE HUTT on 18/11/25.
//

import Foundation
import CoreData

class CoreDataHandler {
    
    static let shared = CoreDataHandler()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "CoreData_NonPrimitive")
        persistentContainer.loadPersistentStores { desc, error in
            if let error = error {
                fatalError("Somwthing went wrong while loading container: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            }catch {
                fatalError("Something is wring while saving! \(error)")
            }
        }
    }
}
