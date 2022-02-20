//
//  ParcelsController.swift
//  Buscador
//
//  Created by Gustavo Cosme on 18/12/21.
//

import SwiftUI
                                                                                     
struct ParcelsController: View {
    
    @State private var isShowCreate = false
    @State var parcels: [ParcelEntity] = ParcelCoreDataViewModel.getList()

    var body: some View {
        
        NavigationView {
            self.getView()
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
            .navigationBarTitle("Encomendas", displayMode: .automatic)
        }
        .navigationViewStyle(.stack)
        .popover(isPresented: $isShowCreate) {
            ParcelsCreateController(showSheet: self.$isShowCreate, parcels: self.$parcels)
        }
    }
    
    private func getView() -> AnyView {
        if !self.parcels.isEmpty {
            return AnyView(ParcelsContainer(context: self))
        }
        return AnyView(Text("Não há encomendas"))
    }
}

private struct ParcelsContainer: View {
    
    var context: ParcelsController
    
    var body: some View {
        List {
            ForEach(self.context.parcels, id: \.self) { parcel in
                NavigationLink(destination: ParcelsDetailsController(code: parcel.code ?? "")) {
                    let parcelCellData = ParcelCellData.make(parcelEntity: parcel)
                    ParcelsViewCell(parcel: parcelCellData)
                }
            }
            .onDelete(perform: self.didDelete)
        }
    }
    
    private func didDelete(at offsets: IndexSet) {
        for i in offsets {
            let parcel = self.context.parcels[i]
            let isDelete = ParcelCoreDataViewModel.delete(parcel)
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
