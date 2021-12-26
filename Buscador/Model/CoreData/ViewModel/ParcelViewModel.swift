//
//  ParcelViewModel.swift
//  Buscador
//
//  Created by Gustavo Cosme on 24/12/21.
//

import CoreData

class ParcelViewModel {
    
    
    // MARK: - Properties

    static private let ENTITY = "ParcelEntity"
    static private var viewContext: NSManagedObjectContext = {
        return NSManagedObjectContext.shared
    }()
}

extension ParcelViewModel {


    // MARK: - Action

    public static func save(title: String, code: String) -> Bool {
        let parcel = ParcelEntity(context: self.viewContext)
        parcel.title = title
        parcel.code = code
        do {
            try viewContext.save()
            return true
        } catch {
            return false
        }
    }
    
    public static func delete(_ parcelEntity: ParcelEntity) -> Bool {
        self.viewContext.delete(parcelEntity)
        do {
            try self.viewContext.save()
            return true
        } catch {
            return false
        }
    }
    
    public static func deleteAll() -> Bool {
        for parcelEntity in self.getList() {
            self.viewContext.delete(parcelEntity)
        }
        do {
            try self.viewContext.save()
            return true
        } catch {
            return false
        }
    }
    
    public static func getList() -> [ParcelEntity] {
        let fetchRequest: NSFetchRequest<ParcelEntity> = ParcelEntity.fetchRequest()
        do {
            return try self.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
}
