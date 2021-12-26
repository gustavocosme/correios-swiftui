//
//  NSManagedObjectContext+Extensions.swift
//  Buscador
//
//  Created by Gustavo Cosme on 25/12/21.
//

import CoreData

extension NSManagedObjectContext {
    
    static var shared: NSManagedObjectContext = {
        let container = NSPersistentContainer(name: "Buscador")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError()
            }
        }
        return container.viewContext
    }()
}
