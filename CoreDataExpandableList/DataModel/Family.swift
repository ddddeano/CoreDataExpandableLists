//
//  Family+CoreDataProperties.swift
//  ExpandableList
//
//  Created by Daniel Watson on 22/02/2021.
//
//

import Foundation
import CoreData

@objc(Family)
public class Family: NSManagedObject {

}


extension Family {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Family> {
        return NSFetchRequest<Family>(entityName: "Family")
    }

    @NSManaged public var name: String
    @NSManaged public var children: NSSet

    public var childrenArray: [Child] {
        let set = children as? Set<Child> ?? []
        
        return set.sorted {
            $0.name < $1.name
        }
    }
}

// MARK: Generated accessors for children
extension Family {

    @objc(addChildrenObject:)
    @NSManaged public func addToChildren(_ value: Child)

    @objc(removeChildrenObject:)
    @NSManaged public func removeFromChildren(_ value: Child)

    @objc(addChildren:)
    @NSManaged public func addToChildren(_ values: NSSet)

    @objc(removeChildren:)
    @NSManaged public func removeFromChildren(_ values: NSSet)

}

extension Family : Identifiable {

}
