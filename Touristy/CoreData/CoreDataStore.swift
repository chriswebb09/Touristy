//
//  CoreDataStore.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/22/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

//  DataStore.swift
//  SlapChat
//
//  Created by susan lovaglio on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStore {
    static let sharedInstance = CoreDataStore()
    let storeName = "Touristy"
    let storeFilename = "Touristy.sqlite"
    
    var locationDataPoints: [LocationEntry] = []
    static let sharedDataStore = DataStore()
    //MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchData() {
        
        let locationDataFetch = NSFetchRequest(entityName: "LocationData")
        do {
            self.locationDataPoints = try self.managedObjectContext.executeRequest(locationDataFetch) as! [LocationEntry]
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
    }
    func generateTestData() {
    }
    
//        let locationOne = NSEntityDescription.insertNewObjectForEntityForName(Loc.entityName, inManagedObjectContext: self.managedObjectContext)
//        let locationOne = NSEntityDescription.insertNewObjectForEntityForName(LocationData.entityName, inManagedObjectContext: self.managedObjectContext) as! LocationData
//        locationOne
        
//        let message2 = NSEntityDescription.insertNewObjectForEntityForName(Message.entityName, inManagedObjectContext: self.managedObjectContext) as! Message
//        message2.content = "First name next"
//        message2.createdAt = NSDate()
//        
//        let message3 = NSEntityDescription.insertNewObjectForEntityForName(Message.entityName, inManagedObjectContext: self.managedObjectContext) as! Message
//        message3.content = "New Name"
//        message3.createdAt = NSDate()
//        
//        saveContext()
//        fetchData()
//    }
    lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource(self.storeName, withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent(self.storeFilename)
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    lazy var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

}