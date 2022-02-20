//
//  TextFieldIcon.swift
//  Buscador
//
//  Created by Gustavo Cosme on 24/12/21.
//

import SwiftUI

enum TextFieldStatus {
    case error
    case sucess
    case normal
}

struct TextFieldBorder: View {
    
    @Binding var params: String
    var title: String
    var hint: String
    @Binding var status: TextFieldStatus
    @Binding var message: String
    var type: UIKeyboardType = .default
    var limit = -1
    var onChange: () -> Void
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(self.title)
                .font(.caption)
                .foregroundColor(self.getColor())
            TextField(self.hint, text: self.$params) .onChange(of: self.params) { newValue in
                self.didChangeText(newValue)
            }
            .modifier(TextFieldModifier(text: self.$params))
            .keyboardType(self.type)
            .font(.system(size: 18))
            .padding(.all, 14)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(self.getColor(), lineWidth: 1)
             )
            
            HStack {
                Image(systemName: self.getIcon())                    .foregroundColor(self.getColor())
                Text(self.message)
                    .font(.caption)
                    .foregroundColor(self.getColor())
            }
        }
    }
    
    private func didChangeText(_ newValue: String) {
        if limit == -1 {
            self.onChange()
        } else {
            if newValue.count > limit {
                params = String(params.prefix(limit))
            }
            self.onChange()
        }
    }
    
    private func getColor() -> Color {
        switch self.status {
        case .normal:
            return Color.input
        case .error:
            return .red
        case .sucess:
            return .green
        }
    }
    
    private func getIcon() -> String {
        switch self.status {
        case .normal:
            return ""
        case .error:
            return "xmark"
        case .sucess:
            return "checkmark"
        }
    }
}

#if DEBUG
struct TextFieldBorder_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TextFieldBorder(params: .constant(""),
                        title: "Title",
                        hint: "Hint",
                        status: .constant(.error),
                        message: .constant("Error")) {}
    }
}
#endif
