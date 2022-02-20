//
//  ParcelsDetailsController.swift
//  Buscador
//
//  Created by Gustavo Cosme on 20/12/21.
//

import SwiftUI

struct ParcelsDetailsController: View {
    
    var code: String

    @ObservedObject
    var viewModel = ParcelViewModel()
     
    init(code: String) {
        self.code = code
        self.viewModel.getParcel(code: code, delegate: nil)
    }
    
    var body: some View {
      
        let detailHeaderInfo = ParcelsDetailsHeaderData.make(eventEntity: viewModel.parcel)
        
        List {
                Section(header: Text("Informações")) {
                    VStack(alignment: .leading) {
                       Text(detailHeaderInfo.data)
                            .font(.headline)
                        Text(detailHeaderInfo.type)
                            .font(.caption2)
                            .bold()
                            .foregroundColor(.blue)
                    }
                    .padding(.vertical, 8)
                }
                
                Section(header: Text("Rastreiamento")) {
                    
                    ZStack(alignment: .leading) {
                        LazyVStack(alignment: .leading, spacing: 0) {
                            ParcelsDetailItemView()
                                .padding(.bottom, 16)
                                .padding(.top, 16)
                            ParcelsDetailItemView()
                                .padding(.bottom, 16)
                            ParcelsDetailItemView()
                                .padding(.bottom, 16)
                            ParcelsDetailItemView()
                                .padding(.bottom, 16)
                        }
                        Color.green.frame(width: 0.5)
                    }
                }
            
        }
        .navigationBarTitle(self.code, displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
            
                Button(action: {
                }, label: {
                    Image(systemName: "square.and.arrow.up")
                })
            }
        }
    }
}

#if DEBUG
struct ParcelsDetailsController_Previews: PreviewProvider {
    static var previews: some View {
        ParcelsDetailsController(code: "")
    }
}
#endif
