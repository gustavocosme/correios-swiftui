//
//  ParcelsDetailsController.swift
//  Buscador
//
//  Created by Gustavo Cosme on 20/12/21.
//

import SwiftUI

struct ParcelsDetailsController: View {
    
    var body: some View {
       
        ScrollView {
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    Text("OM110147480BR")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 2)
                    Text("Previsão 2021-11-17T20:58:00")
                        .font(.headline)
                        .padding(.bottom, 2)
                    Text("SEDEX")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.blue)
                }
                .padding()
                
                Color.gray
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 1)
                    .opacity(0.3)
    
                LazyVStack(alignment: .leading) {
                    ParcelsDetailItemView()
                    ParcelsDetailItemView()
                    ParcelsDetailItemView()
                    ParcelsDetailItemView()
                    ParcelsDetailItemView()
                    ParcelsDetailItemView()
                }
            }
        }
        .navigationTitle("Encomenda")
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

struct ParcelsDetailItemView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Objeto saiu para entrega ao destinatário")
                .font(.body)
                .bold()
                .padding(.bottom, 2)
            Text("2021-11-17T16:53:47")
                .font(.subheadline)
        }
        .padding()
    }
}

#if DEBUG
struct ParcelsDetailsController_Previews: PreviewProvider {
    static var previews: some View {
        ParcelsDetailsController()
    }
}
#endif
