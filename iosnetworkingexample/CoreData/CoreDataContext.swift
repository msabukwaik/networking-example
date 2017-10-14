//
//  CoreDataContext.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 10/10/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit
import CoreData

/// This class is used for storing and fetching the data stored in the core data
public class CoreDataContext {
    
    /**
     This variable is used for presnting the managed object context
     It's used for working with core data stack
     
     ### Usage Example: ###
     ````
     let context = CoreDataContext.context
     let photoFetchRequest:NSFetchRequest<PhotoMO> = PhotoMO.fetchRequest()
     var photos:[PhotoMO] = [PhotoMO]()
     do{
         photos = try CoreDataContext.context.fetch(photoFetchRequest)
     }catch{
     
     }
     ````
     */
    public static var context:NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data stack
    /**
     This variable is used for presnting the managed object context
     It's used for working with core data stack
     
     ### Usage Example: ###
     ````
     let context = CoreDataContext.context
     let photoFetchRequest:NSFetchRequest<PhotoMO> = PhotoMO.fetchRequest()
     var photos:[PhotoMO] = [PhotoMO]()
     do{
     photos = try CoreDataContext.context.fetch(photoFetchRequest)
     }catch{
     
     }
     ````
     */
    public static var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "iosnetworkingexample")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    public static func saveContext (completion:(Bool, String?)->()) {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                completion(true, nil)
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                completion(false, "Unresolved error \(nserror), \(nserror.userInfo)")
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
