//
//  CoreDataHelper.swift
//  Yeap
//
//  Created by Muhammad Irfan on 14/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import CoreData
import UIKit

struct CoreDataHelper {
    
    /* a class constant using the static keyword to access our app's managed object context
     we create a computed class variable that gets a reference to our app delegate's managed object context. We can use our reference to our NSManagedObjectContext to create, edit and delete NSManagedObject objects. */
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    /// get an object so we can add some value to the object
    ///
    /// - Parameter entityName: The name of entity that we want to save or fetch
    /// - Returns: an NSObject, it is useful if we want to add some value to the object
    static func getModelObject(entityName: String) -> NSManagedObject {
        
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        return object
    }
    
    /// save object to core data
    static func saveToCoreData() {
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    /// get all the record from coreData, the default value is []
    ///
    /// - Parameter entityName: The name of entity that we want to fetch
    /// - Returns: an array of any that represent the record of the table. [] if we failed to get the array
    static func fetchCoreData(entityName: String) -> [Any]{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            return result
        } catch {
            print("Failed")
            return []
        }
    }
}
