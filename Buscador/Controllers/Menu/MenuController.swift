//
//  MenuController.swift
//  Buscador
//
//  Created by Gustavo Cosme on 18/12/21.
//

import SwiftUI

struct MenuController: View {
    
    var body: some View {
        
        TabView {
            CepController()
            .tabItem { Label("Cep", systemImage: "house.fill") }
            ParcelsController()
            .tabItem { Label("Encomendas", systemImage: "mail.stack.fill") }
            ConfigurationController()
            .tabItem { Label("Configurações", systemImage: "gearshape.fill") }
        }
    }
}

#if DEBUG
struct MenuController_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MenuController()
    }
}
#endif
