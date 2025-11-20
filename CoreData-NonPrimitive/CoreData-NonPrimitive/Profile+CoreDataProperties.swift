//
//  Profile+CoreDataProperties.swift
//  CoreData-NonPrimitive
//
//  Created by MOBILE HUTT on 18/11/25.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var favouriteColor: NSObject?
    @NSManaged public var id: UUID?
    @NSManaged public var photos: Data?
    @NSManaged public var scores: NSObject?
    @NSManaged public var settings: NSObject?
    @NSManaged public var tags: NSObject?

}

extension Profile : Identifiable {

}
