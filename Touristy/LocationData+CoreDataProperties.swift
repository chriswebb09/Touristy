//
//  LocationData+CoreDataProperties.swift
//  
//
//  Created by Christopher Webb-Orenstein on 8/22/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension LocationData {

    @NSManaged var data: String?
    @NSManaged var locations: NSSet?

}
