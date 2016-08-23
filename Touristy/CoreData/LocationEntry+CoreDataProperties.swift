//
//  LocationEntry+CoreDataProperties.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/23/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension LocationEntry {

    @NSManaged var longitude: String?
    @NSManaged var latitude: String?
    @NSManaged var name: String?
    @NSManaged var locationDescription: String?
    @NSManaged var locationsRelationship: NSManagedObject?

}
