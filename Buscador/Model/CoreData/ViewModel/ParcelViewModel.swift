//
//  ParcelViewModel.swift
//  Buscador
//
//  Created by Gustavo Cosme on 24/12/21.
//

import SwiftUI
import CoreData

class ParcelViewModel: ObservableObject {
    
    @Published var hasSave: Bool = false
    @Published var error: String = ""
    var viewContext: NSManagedObjectContext?
    
    public func save(title: String,
              code: String) {
        
        guard let viewContext = self.viewContext else {
            return
        }
        
        let parcel = ModelParcel(context: viewContext)
        parcel.title = title
        parcel.code = code
        
        do {
            try viewContext.save()
            self.hasSave = true
        } catch {
            self.error = "Ops, problema ao salvar! Tente novamente! ;)"
            print(error.localizedDescription)
        }
        self.error = ""
        self.hasSave = false
    }
    
    public func didDelete(_ parcelEntity: ModelParcel) {
        guard let viewContext = self.viewContext else {
            return
        }
        viewContext.delete(parcelEntity)
        
        do {
            try viewContext.save()
            self.hasSave = true
        } catch {
            self.error = "Ops, problema ao apagar! Tente novamente! ;)"
            print(error.localizedDescription)
        }
    }
    
    public func getList() -> NSFetchRequest<ModelParcel> {
        return NSFetchRequest<ModelParcel>(entityName: "ParcelEntity")
    }
}

class ModelParcel: ParcelEntity { } /// CoreDate
