//
//  ParcelsCreateController.swift
//  Buscador
//
//  Created by Gustavo Cosme on 20/12/21.
//

import SwiftUI

struct ParcelsCreateController: View {
    
    
    // MARK: - Properties
    
    @Binding var showSheet: Bool
    @Binding var parcels: [ParcelEntity]
    @State var code: String = ""
    @State var title: String = ""
    @State var disableButton: Bool = true
    @State var codeStatus: TextFieldStatus = .normal
    @State var codeMessage: String = ""
    @ObservedObject var viewModel = ParcelViewModel()

    
    // MARK: - Controller

    var body: some View {
        
        NavigationView {
            
            ParcelsCreateView(context: self)

            
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
                                status: .constant(.normal),
                                message: .constant(""),
                                type: .namePhonePad,
                                onChange: self.onChangeTitle)
                    .padding(.bottom, 8)
                
                TextFieldBorder(params: self.context.$code,
                                title: "Codigo",
                                hint: "* AA123456789BR",
                                status: self.context.$codeStatus,
                                message: self.context.$codeMessage,
                                limit: 13,
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
                        .disabled(self.getButtonIsDisable())
                        .opacity(self.getButtonIsDisable() ? 0.5 : 1.0)
                }
            }
            .padding()
        }
    }
    
    private func getButtonIsDisable() -> Bool {
        return (self.context.viewModel.parcel == nil) ? true : false
    }
}


// MARK: - Actions

extension ParcelsCreateView: ParcelViewModelDelegate {
    
    private func didCreateParcel() {
        if ParcelCoreDataViewModel.save(title: self.context.title, code: self.context.code) {
            self.context.parcels = ParcelCoreDataViewModel.getList()
            self.context.showSheet = false
        }
    }
    
    private func onChangeTitle() {
        self.hasValidation()
    }
    
    private func onChangeCode() {
        self.context.code = self.context.code.uppercased()
        self.hasValidation()
        let hasCode = NSRegularExpression.match(text: self.context.code, regex: .parcel)
        let codeCount = self.context.code.count
        if codeCount == 13 {
            if hasCode {
                self.context.codeMessage = "Validando..."
                self.context.viewModel.getParcel(code: self.context.code, delegate: self)
            } else {
                self.didStatusError()
            }
        } else {
            self.context.codeStatus = .normal
            self.context.codeMessage = ""
            self.context.viewModel.reset()
        }
    }
    
    private func hasValidation() {
        let hasCode = NSRegularExpression.match(text: self.context.code, regex: .parcel)
        if self.context.code == "" || self.context.title == "" || !hasCode {
            self.context.disableButton = true
        } else {
            self.context.disableButton = false
        }
    }
    
    private func didStatusError() {
        self.context.codeStatus = .error
        self.context.codeMessage = "Código inválido! :("
    }
    
    func didCompletion(_ parcel: EventEntity?) {
       
        if parcel != nil {
            self.context.codeStatus = .sucess
            self.context.codeMessage = "Ok ;)"
        } else {
            self.didStatusError()
        }
    }
}


// MARK: - Previews

#if DEBUG
struct ParcelsCreateController_Previews: PreviewProvider {
    static var previews: some View {
        ParcelsCreateController(showSheet: .constant(true), parcels: .constant([]))
            .preferredColorScheme(CONFIG.Debug.style)
    }
}
#endif
