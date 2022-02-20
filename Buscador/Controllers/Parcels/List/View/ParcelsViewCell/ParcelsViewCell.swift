//
//  ParcelsCell.swift
//  Buscador
//
//  Created by Gustavo Cosme on 19/12/21.
//

import SwiftUI

struct ParcelsViewCell: View {
    
    var parcel: ParcelCellData
   
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(parcel.title)
                    .font(.headline)
                    .padding(.top, 8)
                Text(parcel.code)
                    .font(.subheadline)
                    .padding(.bottom, 8)
            }
            Spacer()
        }
    }
}

#if DEBUG
struct ParcelsCell_Previews: PreviewProvider {
    
    static var previews: some View {
        ParcelsViewCell(parcel: ParcelCellData.make())
    }
}
#endif
