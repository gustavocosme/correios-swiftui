//
//  ParcelsCreateController.swift
//  Buscador
//
//  Created by Gustavo Cosme on 20/12/21.
//

import SwiftUI
import ToastUI

struct ParcelsCreateController: View {
    
    
    // MARK: - Properties
    
    @Binding var showSheet: Bool
    @State var code: String = ""
    @State var title: String = ""
    @State var presentingToast: Bool = false
    @State var disableButton: Bool = true
    
    
    // MARK: - Controller

    var body: some View {
        
        NavigationView {
            
            ParcelsCreateView(context: self)


            // MARK: - Navigation

            .toast(isPresented: $presentingToast, dismissAfter: 2.0) {
            } content: {
                ToastView("Ops, Houve uma falha! Tente novamente")
                    .toastViewStyle(ErrorToastViewStyle())
            }
            
            
            // MARK: - Toolbar

            .navigationTitle("Cadastro")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        self.showSheet = false
                    }, label: {
                        Image(systemName: "multiply.circle.fill")
                    })
                }
            }
        }
    }
}

// MARK: - View

struct ParcelsCreateView: View {
    
    var context: ParcelsCreateController!
    
    var body: some View {
        
        ScrollView {
    
            VStack(alignment: .leading) {
                
                TextFieldBorder(params: self.context.$title,
                                title: "Titulo",
                                hint: "* Informe o titulo",
                                type: .namePhonePad,
                                onChange: self.onChangeTitle)
                    .padding(.bottom, 8)
                
                TextFieldBorder(params: self.context.$code,
                                title: "Codigo",
                                hint: "* AA123456789BR",
                                onChange: self.onChangeCode)
                    .padding(.bottom, 18)
                
                HStack {
                    Spacer()
                    Button(action: {
                        self.didCreateParcel()
                    }, label: {
                        Text("Cadastrar")
                    })
                        .buttonStyle(ButtonAppStyle())
                        .disabled(self.context.disableButton)
                        .opacity(self.context.disableButton ? 0.5 : 1.0)
                }
            }
            .padding()
        }
    }
}

// MARK: - Actions

extension ParcelsCreateView {
    
    private func didCreateParcel() {
        if ParcelViewModel.save(title: self.context.title, code: self.context.code) {
            self.context.showSheet = false
        } else{
            self.context.presentingToast = true
        }
    }
    
    private func onChangeTitle() {
        self.hasValidation()
    }
    
    private func onChangeCode() {
        self.context.code = self.context.code.uppercased()
        self.hasValidation()
        
    }
    
    private func hasValidation() {
        if self.context.code == "" || self.context.title == "" {
            self.context.disableButton = true
        } else {
            self.context.disableButton = false
        }
    }
}


// MARK: - Debug

#if DEBUG
struct ParcelsCreateController_Previews: PreviewProvider {
    static var previews: some View {
        ParcelsCreateController(showSheet: .constant(true))
            .preferredColorScheme(CONFIG.Debug.style)
    }
}
#endif
