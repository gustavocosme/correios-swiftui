//
//  ParcelsCreateController.swift
//  Buscador
//
//  Created by Gustavo Cosme on 20/12/21.
//

import SwiftUI

struct ParcelsCreateController: View {
    
    @Binding var showSheet: Bool
    @State private var codigo: String = ""
    @State private var title: String = ""
    @Environment(\.managedObjectContext) var viewContext

    var body: some View {
        
        NavigationView {
        
            ScrollView {
            
                VStack(alignment: .leading) {
                    
                    TextFieldBorder(params: self.$title, hint: "* Informe o titulo")
                    TextFieldBorder(params: self.$codigo, hint: "* Informe o codigo")
                        .padding(.bottom, 4)

                    HStack {
                        Spacer()
                        Button(action: {
                            self.didCreateParcel()
                        }, label: {
                            Text("Cadastrar")
                        })
                        .buttonStyle(ButtonAppStyle())
                    }
                }
                .padding()
                
            }
            .navigationTitle("Cadastro")
            .toolbar {
           
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        self.didClose()
                    }, label: {
                        Image(systemName: "multiply.circle.fill")
                    })
                }
            }
        }
    }
}

extension ParcelsCreateController {
    
    private func didCreateParcel() {
        self.didClose()
    }
    
    private func didClose() {
        self.showSheet = false
    }
}

#if DEBUG
struct ParcelsCreateController_Previews: PreviewProvider {
    static var previews: some View {
        ParcelsCreateController(showSheet: .constant(true))
    }
}
#endif
