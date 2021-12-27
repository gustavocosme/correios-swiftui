//
//  ParcelsController.swift
//  Buscador
//
//  Created by Gustavo Cosme on 18/12/21.
//

import SwiftUI

struct ParcelsController: View {
    
    @State private var isShowCreate = false
    @State var parcels: [ParcelEntity] = ParcelViewModel.getList()

    var body: some View {
        
        NavigationView {
         
            ParcelsContainer(context: self)
            .navigationTitle("Encomendas")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        self.isShowCreate = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
        .popover(isPresented: $isShowCreate) {
            ParcelsCreateController(showSheet: self.$isShowCreate, parcels: self.$parcels)
        }
    }
}

private struct ParcelsContainer: View {
    
    var context: ParcelsController
    
    var body: some View {
        
        List {
            ForEach(self.context.parcels, id: \.self) { parcel in
                NavigationLink(destination: ParcelsDetailsController()) {
                    ParcelsViewCell(parcel: parcel)
                }
            }
            .onDelete(perform: self.didDelete)
        }
    }
    
    private func didDelete(at offsets: IndexSet) {
        for i in offsets {
            let parcel = self.context.parcels[i]
            let isDelete = ParcelViewModel.delete(parcel)
            if isDelete {
                context.parcels.remove(atOffsets: offsets)
            }
        }
    }
}

#if DEBUG
struct ParcelsController_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ParcelsController()
    }
}
#endif
