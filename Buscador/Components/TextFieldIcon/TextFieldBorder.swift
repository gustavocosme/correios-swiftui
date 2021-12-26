//
//  TextFieldIcon.swift
//  Buscador
//
//  Created by Gustavo Cosme on 24/12/21.
//

import SwiftUI

struct TextFieldBorder: View {
    
    @Binding var params: String
    var title: String
    var hint: String
    var type: UIKeyboardType = .default
    var onChange: () -> Void

    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(self.title)
                .font(.caption)
                .foregroundColor(Color.input)
            TextField(self.hint, text: self.$params) .onChange(of: self.params) { newValue in
                self.onChange()
            }
            .modifier(TextFieldModifier(text: self.$params))
            .keyboardType(self.type)
            .font(.system(size: 20))
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.input, lineWidth: 1)
             )
        }
    }
}

#if DEBUG
struct TextFieldIcon_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TextFieldBorder(params: .constant(""),
                        title: "Title",
                        hint: "Título") {}
    }
}
#endif
