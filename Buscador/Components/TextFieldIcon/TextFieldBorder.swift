//
//  TextFieldIcon.swift
//  Buscador
//
//  Created by Gustavo Cosme on 24/12/21.
//

import SwiftUI

struct TextFieldBorder: View {
    
    @Binding var params: String
    var hint: String

    var body: some View {
        
        TextField(self.hint, text: self.$params)
        .font(.system(size: 18))
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
            .stroke(Color.gray, lineWidth: 1)
         )
    }
}

#if DEBUG
struct TextFieldIcon_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TextFieldBorder(params: .constant(""),
                      hint: "Título")
    }
}
#endif
