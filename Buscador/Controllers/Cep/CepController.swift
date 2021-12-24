//
//  CepController.swift
//  Buscador
//
//  Created by Gustavo Cosme on 18/12/21.
//

import SwiftUI

struct CepController: View {
    
    @State private var searchText = ""

    var body: some View {
        
        NavigationView {
         
            LazyVStack {
            }
            .navigationTitle("Cep")
        }
    }
}

struct CepController_Previews: PreviewProvider {
    static var previews: some View {
        CepController()
    }
}
