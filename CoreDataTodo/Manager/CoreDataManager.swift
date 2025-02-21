//
//  CoreDataManager.swift
//  CoreDataTodo
//
//  Created by Mustafa Ölmezses on 21.02.2025.
//

import Foundation
import CoreData

class CoreDataManager{
    static let instance = CoreDataManager() //Singleton
    let container :NSPersistentContainer
    let context:NSManagedObjectContext
    
    
    init() {
        container = NSPersistentContainer(name: "ListCoreData")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Eroor loading persistent stores: \(error.localizedDescription)")
            }
        }
        context = container.viewContext
    }
    
    func saveData(){
        do {
            try context.save()
            print("Saved Succesfly!")
        }catch{
            print("Error Saving Data \(error.localizedDescription)")
        }
    }
    
    
}
