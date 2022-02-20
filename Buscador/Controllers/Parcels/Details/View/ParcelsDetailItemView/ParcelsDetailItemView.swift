//
//  ParcelsDetailItemView.swift
//  Buscador
//
//  Created by Gustavo Cosme on 20/02/22.
//

import SwiftUI

struct ParcelsDetailItemView: View {
    var body: some View {
        
        HStack {
            VStack {
                ZStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 4, height: 4)
                        .cornerRadius(4)
                        .padding(.leading, -1.8)
                }
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Objeto saiu para entrega ao destinatário")
                    .font(.callout)
                Text("2021-11-17T16:53:47")
                    .font(.caption2)
                    .padding(.top, 4)
            }
            .padding(.leading, 8)
        }
    }
}

struct ParcelsDetailItemView_Previews: PreviewProvider {
    static var previews: some View {
        ParcelsDetailItemView()
    }
}
