//
//  ParcelsCell.swift
//  Buscador
//
//  Created by Gustavo Cosme on 19/12/21.
//

import SwiftUI

struct ParcelsViewCell: View {
    
    var parcel: ParcelEntity
   
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                Text(parcel.title ?? "")
                    .font(.title)
                    .padding(.bottom, 1)
                Text(parcel.code ?? "")
                    .font(.headline)
            }
            Spacer()
        }
        .frame(height: 88)
    }
}

#if DEBUG
struct ParcelsCell_Previews: PreviewProvider {
    
    static var previews: some View {
        ParcelsViewCell(parcel: ParcelEntity())
    }
}
#endif
