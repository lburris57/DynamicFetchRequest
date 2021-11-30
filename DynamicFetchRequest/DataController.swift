//
//  DataController.swift
//  DynamicFetchRequest
//
//  Created by Larry Burris on 11/30/21.
//
import Foundation
import CoreData

class DataController: ObservableObject
{
    let container = NSPersistentContainer(name: "CoreDataModel")
    
    init()
    {
        container.loadPersistentStores
        {
            description, error in
            
            if let error = error
            {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
