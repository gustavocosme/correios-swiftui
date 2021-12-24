//
//  ParcelsController.swift
//  Buscador
//
//  Created by Gustavo Cosme on 18/12/21.
//

import SwiftUI

struct ParcelsController: View {
    
    @State private var isShowCreate = false

    var body: some View {
        
        NavigationView {
         
            ParcelsContainer()
            .navigationTitle("Encomendas")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button("Editar") {
                        
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        
                        self.isShowCreate = true
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                    })
                }
            }
        }.popover(isPresented: $isShowCreate) {
            
            ParcelsCreateController(showSheet: self.$isShowCreate)
        }
    }
}

private struct ParcelsContainer: View {
    var body: some View {
        
        List {
        
            ForEach(0..<10) { i in
                
                NavigationLink(destination: ParcelsDetailsController()) {
                    
                    ParcelsViewCell()
                }
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
