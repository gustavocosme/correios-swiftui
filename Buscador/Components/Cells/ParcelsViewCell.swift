//
//  ParcelsCell.swift
//  Buscador
//
//  Created by Gustavo Cosme on 19/12/21.
//

import SwiftUI

struct ParcelsViewCell: View {
   
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                Text("Tenis final de ano")
                    .font(.title)
                    .padding(.bottom, 1)
                Text("97928374982749872394")
                    .font(.body)
                    .padding(.leading, 4)
            }
            Spacer()
        }
        .frame(height: 88)
    }
}

#if DEBUG
struct ParcelsCell_Previews: PreviewProvider {
    
    static var previews: some View {
    
        ParcelsViewCell()
    }
}
#endif
