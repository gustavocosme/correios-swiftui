//
//  ButtonStyle.swift
//  Buscador
//
//  Created by Gustavo Cosme on 24/12/21.
//

import SwiftUI

struct ButtonAppStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .font(.system(size: 18, weight: .heavy, design: .default))

    }
}
