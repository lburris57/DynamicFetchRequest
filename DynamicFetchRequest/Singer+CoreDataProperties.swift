//
//  Singer+CoreDataProperties.swift
//  DynamicFetchRequest
//
//  Created by Larry Burris on 11/30/21.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    
    var wrappedFirstName: String
    {
        firstName ?? "Unknown"
    }
    
    var wrappedLastName: String
    {
        lastName ?? "Unknown"
    }

}

extension Singer : Identifiable {

}
