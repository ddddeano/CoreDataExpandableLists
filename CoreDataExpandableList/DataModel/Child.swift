//
//  Child+CoreDataProperties.swift
//  ExpandableList
//
//  Created by Daniel Watson on 22/02/2021.
//
//

import Foundation
import CoreData

@objc(Child)
public class Child: NSManagedObject {

}

extension Child {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Child> {
        return NSFetchRequest<Child>(entityName: "Child")
    }

    @NSManaged public var name: String
    @NSManaged public var family: Family

}

extension Child : Identifiable {

}
