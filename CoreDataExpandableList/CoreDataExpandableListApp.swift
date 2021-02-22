//
//  CoreDataExpandableListApp.swift
//  CoreDataExpandableList
//
//  Created by Daniel Watson on 22/02/2021.
//

import SwiftUI
import CoreData
@main
struct CoreDataExpandableListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FamilyModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
